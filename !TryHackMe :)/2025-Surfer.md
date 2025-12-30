# TryHackMe: Surfer

**Challenge Name:** Surfer
**Platform:** TryHackMe
**Category:** SSRF
**Difficulty:** Easy
**Date Completed:** 07/02/2025

# Introduction

![6924475c1dc389f44b230968c782d984](https://github.com/user-attachments/assets/d29068ec-57ca-4fb0-9ada-5e49cd77098b)

"Surf some internal webpages to find the flag!"

# Method

When I first visited the IP address, I was met with a login page. I tried `admin` `admin` as the username and password and got an immediate login (this rarely actually happens :D).

![Screenshot 2025-07-02 205235](https://github.com/user-attachments/assets/093f066e-bb8f-496a-a01a-9e3216f649b4)

Now on the dashboard, under recent activity we can see a message that reads:
`Internal pages hosted at /internal/admin.php. It contains the system flag`

This is valuable information as we now know where the flag is located.

![Screenshot 2025-07-02 205405](https://github.com/user-attachments/assets/51a2723d-2a00-46f7-a7cb-045e2ffd88d5)

If we visit the sub-page, we can see a message reading:
`This page can only be accessed locally`

![Screenshot 2025-07-02 205427](https://github.com/user-attachments/assets/884f3e88-ed46-422a-a120-402b8cbf5d0f)

At the bottom of the page, there is an "Export to PDF" button. When we try to export to PDF, we can see on the document that the file is generated on localhost.

Because of this, I decided to go for an intercept with **Burp Suite**.
We will intercept the request while requesting the pdf file.

![Screenshot 2025-07-02 210630](https://github.com/user-attachments/assets/18bc7306-69fe-4d98-8b8d-b3e4b6fe7f58)

When we do so, we are given the server-info url. We can modify this url to take us to the admin page that can only be accessed locally.

`url=http://127.0.0.1/internal/admin.php`

![Screenshot 2025-07-02 211006](https://github.com/user-attachments/assets/ac46c939-5183-4bf9-9576-7ef057faf965)

Now we can just forward to send the request and we are met with the flag.

![Screenshot 2025-07-02 211049](https://github.com/user-attachments/assets/66a8fc23-e6d8-4bf3-807f-6654cce1be86)

