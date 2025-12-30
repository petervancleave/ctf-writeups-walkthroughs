
# # TryHackMe: OhSINT

**Challenge Name:** OhSINT
**Platform:** TryHackMe
**Category:** OSINT
**Difficulty:** Easy
**Date Completed:** 04/01/2025

## 1. Overview

The OhSINT challenge asks us to download a jpg file to start. It is a beginner friendly challenge that tests basic OSINT skills. The goal of the challenge is to extract information from the file and use that as a foundation to answer questions about the owner.
## 2. Tools and Techniques

- ExifTool
- A Web Browser (in my case Firefox)
## 3. Solution

We begin by downloading the file. We are given a jpg file that looks like this when opened:

![Screenshot 2025-04-01 160225](https://github.com/user-attachments/assets/7185c6da-9120-40cb-acb1-2667454ff2c3)


This does not tell us much. It appears to be the classic Window XP desktop background. 

We can use ExifTool in the command line to extract metadata about this image:

```bash
exiftool WindowsXP_1551719014755.jpg
```

After doing so, we are given a list of useful information about the image:

![Screenshot 2025-04-01 160242](https://github.com/user-attachments/assets/e7e5fcd4-22db-4c29-9824-8491e105895a)

The first task of the challenge is to find the "user's avatar." Knowing this, I thought the name attributed to the image Copyright might lead to something useful.

![Screenshot 2025-04-01 160251](https://github.com/user-attachments/assets/cdeb8a34-223d-488c-bf91-fdce290eb3ee)


The name is "OWoodflint."

It sounds like a username, so I decided to enter it into Firefox to see what would pop up.

![Screenshot 2025-04-01 160258](https://github.com/user-attachments/assets/deb0f83d-7d3a-4d23-be86-cfca72267a12)


The first three hits are links to a github, twitter, and wordpress blog. They all seem to be associated with the OWoodflint username.

The github profile picture was just a default pfp, so I checked the twitter account.

![Screenshot 2025-04-01 160303](https://github.com/user-attachments/assets/c6a491e2-a0b3-4289-a543-ab6f49195243)


Given this information we can now answer the first task, and it works.

In the user's twitter posts, we can see a post about a Bssid:

```pug
Bssid:B4:5D:50:AA:86:41
```

![Screenshot 2025-04-01 160312](https://github.com/user-attachments/assets/bcd518f7-273f-4ee1-87c7-2b30e157f386)


The next task asks us which city this person is in. We can use this BSSID to help us locate the user.

We can go to Wigle and use a basic search of the BSSID to help us locate the user:

![Screenshot 2025-04-01 160317](https://github.com/user-attachments/assets/2c0f9cba-317b-4549-9c00-8656197fbeec)

![Screenshot 2025-04-01 160322](https://github.com/user-attachments/assets/402044ea-284d-40a7-b759-65bfba0005c7)


This puts us in London.

If we zoom in, we can see the SSID associated:

![Screenshot 2025-04-01 160327](https://github.com/user-attachments/assets/6b552dc4-2d23-4e15-8939-94318341a805)


Now we have found the location and the SSID of the WAP the user is connected to. We now have answers to the first three tasks. 

Lets move on to the fourth task where we are asked about the user's personal email address.

If I remember correctly, I saw an email address pop up when I initially searched for the user in Firefox. I will go back and check.

![Screenshot 2025-04-01 160332](https://github.com/user-attachments/assets/8048b2a2-caaf-49ce-bd5c-902e44170324)


I was able to locate the email under the GitHub profile.

This information helps us answer the fourth and fifth task of the email address and the site where it was found.

The next task is to find out where the user has recently gone on vacation.

I decided to go to the GitHub profile to see if there was anything informative regarding this. I could not find anything, but it did link to the personal blog site we saw before, so I visited the site.
![Screenshot 2025-04-01 160337](https://github.com/user-attachments/assets/6bc22d1f-f07d-4b86-8898-19143e8f0ead)

![Screenshot 2025-04-01 160344](https://github.com/user-attachments/assets/d49c7798-6ad0-4de2-88b5-dd6f6c7196bb)

On the blog site, we can see where the user is currently on vacation.

---

Now, we can move on to the final task, which is to find the user's password. At first I was a little confused by this because this room is about OSINT and did not include any exploitation or vulnerability finding up until this point. With that knowledge, I concluded the password must be hidden within the three sites associated with the user - the most likely being the wordpress blog site as twitter and github would not have revealing source code.

I inspected the source code of the blog site and dug around for a bit until I stumbled upon something interesting - a strange string in plaintext under the entry content. This was the answer to the final task.

![Screenshot 2025-04-01 160354](https://github.com/user-attachments/assets/4f97916d-1236-40dc-9901-53c804de0d6a)







