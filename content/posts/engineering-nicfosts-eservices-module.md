---
title: '* Engineering Nicfosts Eservices Module'
date: 2023-09-10
draft: false
showBreadCrumbs: true
tags: ['Programming', 'React']
showToc: true,
cover:
  image: 'https://i.ibb.co/kGByd3B/20230817-184826.jpg'
  # can also paste direct link from external site
  # ex. https://i.ibb.co/K0HVPBd/paper-mod-profilemode.png
  alt: 'V'
  caption: 'The document. You may want to flip your phone sideways'
  relative: false # To use relative path for cover image, used in hugo Page-bundles
---

The "[Nigerian Council of Food Science and Technology](https://nicfost.gov.ng/) is a professional body in Nigeria that is focused advancing the field of food science and technology in the country. It serves as an organization for professionals, researchers, educators, and practitioners who are involved in various aspects of food science and technology.

They have a portal that is used by the adminstrative team at Nicfost. The client side is written entirely in JavaScript. I didn't build the client, it was written by someone else. After all, I have expressed my distate severall on this blog for JavaScript as [a bad dynamic programming language for robust projects](https://news.ycombinator.com/item?id=4113458). I use Typescript instead. The backend is also written in Java, I didn't write the initial Java backend though - which I wish I did. The refactoring and process wasn't funny.

## The Task

Nicfost had contracted a company called Encentral solutions to facilitate the printing of hard-copy certificates. They were to design a RESTful API endpoint to facilitate the generation of the certificate off a license number, registration number or serial provided from our end, and return it in PDF format. After the delays, eventually encentral were able to deliver. I went ahead to test the endpoint by sending a payload in the request body (As me and my manager convinced them to go with the request body over parameters) which then returned the file in my postman client, with the header `application/pdf`.

### What was my job?

Build the **Eservices Module**!

- Create a wrapper around ecentral's URL endpoint to perform the following actions:
  - Initiate the call.
  - This would be done by picking the serial number or license number from the client, checking if it was in our database — before then passing the request to Ecentral's URL via a [REST Template in spring boot.](https://www.baeldung.com/rest-template)
- Update and create the swagger to document the freshly created endpoint under the module name "Eservices."
- Return the response from Ecentral to the client.
- Implement an authentication mechanism involved by sending headers with the request, this was to be done Via JWT — but we approached this another way.
- Employ a caching mechanism, or store the files in [Base64 format](https://en.wikipedia.org/wiki/Base64) to prevent excess calls to Ecentral solutions.
- Package and distribute the Java executable to be deployed by Nicfost's systems engineer. They use a Windows Server — I can't vomit enough

### The bottlenecks

I was introduced to the codebase and existing technology stack of the platform — within a week. I had to walk myself through the codebase and frequently call up the previous engineer who worked on it for clarififications. I had to be careful, one bug or mistep, and I would push a bug into production that could maybe lead to the application's unfortunate downtime.

The bottlenecks were:

- No [ORM](<https://www.freecodecamp.org/news/what-is-an-orm-the-meaning-of-object-relational-mapping-database-tools/#:~:text=Object%20Relational%20Mapping%20(ORM)%20is,(OOP)%20to%20relational%20databases.>) available. ORMs help by creating a layer of abstraction between your code and SQL. It communicates with your database via Object Oriented Code to run SQL instructions. There was no ORM - I don't know who made the decision, but I was surprised. I know ORMs should be avoided in certain usecases, but not this one. The next case explains why.
- No direct access to the production server, but just the production database. The workaround was the previous engineer had an SQL script of basically the entire structure in production.
- No ORM meant crafting raw SQL queries and writing directly into the database console, bad news. The database was Postgres anyways.
- The code was written with a C# based approach, relying on so much DAOs, and SQL query builders for the simplest tasks, since there was NO ORM.
- Ecentral was returning their own CORS header, which later led to a big conflict on the client before I resolved the issue.
- The code was overall, poorly written, not well commented with a poor authentication mechanism. It used JWT authentication, which was somewhat scrappy hence we left it that way to speed up time.
- Outdated spring boot version. Running version two and not three.

### The workarounds

Since there was no ORM and no direct access to the production sever as aforementioned previously above — the first step I took was to call the other engineer up who generated an SQL script of how the tables were structured on the production server. Luckily, he had created some Models in a folder, although not being used by the JPA or any significant ORM which served as a guideline.

After some extensive evaluation, the clever workaround to have the client send in the headers as requested for the call, was to create a table with the fields `app_id` and `app_key.` Like so:

```sql
CREATE TABLE Credentials (
  id INT AUTO_INCREMENT PRIMARY KEY,
  appId VARCHAR(255) NOT NULL,
  appKey VARCHAR(255) NOT NULL
);
```

We generated two random keys, long. About 32 characters long for each ` appId` and `appKey`, then I wrote a query to insert into the tables. The purpose was to simulate an authentication like system, so no one could make a call without authorised keys we could delete or update. I was to create three endpoints. Endpoints for getting the License Certificate, Certificate of Registration and the Premises Certificate.

Here, I will illustrate my thought process and flow while I wrote the code to execute the request. I have tried my best to make the below code self explanatory:

```java
// Here in API Operation, I define the value which would be visible in the Swagger.
@ApiOperation(value = "This is used to get Certificate File from Ecentral solutions.")
    // It's a post request because we are sending a request payload from the client.
    @PostMapping("/GetCertificateFile")
    // I configured the response entity to <byte[]> since I am expecting a binary file.
    public ResponseEntity<byte[]> GetCertificateFile(@RequestBody CertificateFileRequest requestPayload) {
        // The URL where I make the call to.
        String externalUrl = "certificate/registration";
        // Setting the headers for the request
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        // The entity request is facilitated via CertificateFilerequest.
        HttpEntity<CertificateFileRequest> requestEntity = new HttpEntity<>(requestPayload, headers);

        // Initiate an instance of REST Template
        RestTemplate restTemplate = new RestTemplate();

        // Return the response entity.
        ResponseEntity<byte[]> responseEntity = restTemplate.exchange(
                externalUrl,
                HttpMethod.POST,
                requestEntity,
                byte[].class
        );
```

The CertificateRequest, looked like the below so you can visualise the payload data being requested from the client:

```java
public class CertificateFileRequest {
    private String id;
    private String nameOfCompany;
    private String cfsnNo;
    private String dateOfRegistration;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNameOfCompany() {
        return nameOfCompany;
    }

    public void setNameOfCompany(String nameOfCompany) {
        this.nameOfCompany = nameOfCompany;
    }

    public String getCfsnNo() {
        return cfsnNo;
    }

    public void setCfsnNo(String cfsnNo) {
        this.cfsnNo = cfsnNo;
    }

    public String getDateOfRegistration() {
        return dateOfRegistration;
    }

    public void setDateOfRegistration(String dateOfRegistration) {
        this.dateOfRegistration = dateOfRegistration;
    }
}

```

The problem was:

```
Multiple cors headers were sent in your request. The server should only return a single CORS header.
```

So to walk around this was relatively simple. Extract the headers being received from ecentral's response and explicitly filter out [`Access-Control-Allow-Origin`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Origin) which contained the CORS header. I approached the problem this way.

```java
        HttpHeaders modifiedHeaders = new HttpHeaders();
        responseHeaders.forEach((key, value) -> {
        // extract and ignore the header
            if (!key.equalsIgnoreCase("Access-Control-Allow-Origin")) {
                modifiedHeaders.addAll(key, value);
            }
        });

        return ResponseEntity.status(responseEntity.getStatusCode())
                .headers(modifiedHeaders)
                .body(responseEntity.getBody());

```

That way, I was able to kill the error, and the response was successful. Ecentral were also using PHP so that was why I implemented the caching mechanism as stated earlier, to reduce the calls. Also I benchmarked their server to return a certificate within **6-7** seconds on an average.

## What about the authentication?

I know I didn't mention, but apparently the model changed. You see the process was meant to work like this:

- Three endpoints, that would be called by the client. This would initialise. No authentication here.
- Depending on which endpoint was called, I would pick the ID sent by the client and make a request to Ecentral.
- Ecentral receives the ID and then sends a post request to our server with the data.
- Another endpoint, which now requires the `appId` and `app_Key` as below is expected to be sent as headers to retrieve the certificate.

```java
 @ApiOperation(value = "This is used to get registration certificate by licensenumber.")
    @PostMapping("/GetCertificateData")
    public ResponseEntity<List<RegistrationResponse>> getCertificateByLicenseNumber(@RequestBody CertificateIdRequest id,
    // send the appId and appKey in the request
    @RequestHeader("appId") String appId,
    @RequestHeader("appKey") String appKey) {
        if (!validateAppCredentials(appId, appKey)) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Collections.emptyList());
        }

        List<RegistrationResponse> certificateResponses = registrationdao.getRegistrationResponsesByLicenseNumber(id.id);
        return ResponseEntity.ok(certificateResponses);
    }
```

Then I designed a simple function to query the database to check if the headers match the data in the database:

```java
 private boolean validateAppCredentials(String appId, String appKey) {
        String sql = "SELECT COUNT(*) FROM collaborator WHERE appId = ? AND appKey = ?";

        int count = jdbcTemplate.queryForObject(sql, Integer.class, appId, appKey);

        return count > 0;
    }
```

## The architecture

So eventually this was the structure:

![The first architecture](https://i.ibb.co/TK4vkB2/nicfost-structure-1-1.png)

So like we said, the client sends a post request to a server that returns it back to the database that is fetched and returned from Nicfost's server and retrieved by the client via a GET Request. We later opted out of this system and went for something much more direct, like so:

![The second architecture](https://i.ibb.co/mrjn6X9/nicfost-structure-2.png")

The second architecture as demonstrated above is far much easier, and has effectively cut us a lot of slack. As you can see we return the response virtually direct. I think the other engineers attempted to avoid conflicting headers being served, whicn I resolved anyways.

They were so many bottlenecks, but as usual I was able to eventually wriggle away and sort things out.
