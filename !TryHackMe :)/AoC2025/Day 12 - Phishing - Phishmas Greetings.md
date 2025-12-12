
## Learning Objectives

- Spot phishing emails by analyzing headers, content, and intent.
- Learn trending phishing techniques like punycode domains and side-channel lures.
- Differentiate spam (bulk, non-deceptive promotions) from phishing (targeted deception for theft/malware).

A good 3 step method to tell if an email is phishing is:

1. Who am I receiving the email from?
2. Does the email content look suspicious
3. Look at the email authentication protocols 

Tip: Always inspect without interacting—phishing relies on curiosity/urgency. Use browser dev tools (F12) for link inspection if needed.

| Aspect        | Phishing                                                      | Spam                                                |
| ------------- | ------------------------------------------------------------- | --------------------------------------------------- |
| **Intent**    | Targeted deception (e.g., steal credentials, deliver malware) | Bulk noise (e.g., marketing, scams for clicks/data) |
| **Precision** | High—mimics trusted sources                                   | Low—mass-sent, generic                              |
| **Example**   | Fake internal email requesting VPN login                      | SOC-mas logistics promo                             |
| **Risk**      | Direct harm (data exfil, fraud)                               | Annoyance (filterable)                              |

### Common Phishing Techniques

- **Impersonation:** Fake sender (e.g., Gmail vs. @tbfc.com). Check domain mismatch.
- **Social Engineering:** Urgency ("URGENT!"), emotional lures (fear/reward), side-channel shifts (e.g., "Reply via WhatsApp"), malicious requests (e.g., credentials).
- **Spoofing:** Forged headers. Look for failed SPF/DKIM/DMARC in Authentication-Results; mismatched Return-Path (e.g., easterbb.com).
- **Typosquatting/Punycode:** Misspelled/encoded domains (e.g., glthub.com or Unicode ƒ as f; headers show xn-- prefix).
- **Malicious Attachments/Links:** Disguised files (.html as "voice message") or lures via trusted services (OneDrive to fake login).
- **Trending Tactics:** Precision lures (e.g., "Laptop Upgrade" via Google Drive); multi-channel (email → SMS); fake portals mimicking Office 365.

Tip: Hover links (don't click); decode punycode with tools like punycode.de; verify via internal channels.

---

Email 1 - Invoice from Santa Clause

SS1
<img width="1893" height="870" alt="ss1" src="https://github.com/user-attachments/assets/37c865f6-8f2a-4be6-931a-5b3eaff30645" />

At first glance the email content looks benign and legitimate, the from address looks normal:
"service@paypal.com" <service@paypal.com>
and the message seems normal.

One thing to point out is the note from seller looks fairly normal, but there is a sense of urgency being provoked. This could be a red flag.

```
|   |
|---|
|Note from seller|
|Fraud Alert, Didn't make this easter egg order? Call PayPal immediately at +1 (800) XMAS-1225|
```

If we dig deeper and look at the headers, we get a better idea of this email's intentions.

|   |   |
|---|---|
|Received|from DM6PR07MB6956.namprd07.prod.outlook.com (2603:10b6:5:1eb::9) by MN2PR07MB8048.namprd07.prod.outlook.com with HTTPS; Fri, 12 Dec 2025 14:16:12 +0000|
|Received|from MW4PR03CA0341.namprd03.prod.outlook.com (2603:10b6:303:dc::16) by DM6PR07MB6956.namprd07.prod.outlook.com (2603:10b6:5:1eb::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.23; Fri, 12 Dec 2025 14:16:06 +0000|
|Received|from CO1PEPF000042AD.namprd03.prod.outlook.com (2603:10b6:303:dc:cafe::7a) by MW4PR03CA0341.outlook.office365.com (2603:10b6:303:dc::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25 via Frontend Transport; Fri, 12 Dec 2025 14:16:06 +0000|
|Authentication-Results|spf=fail (sender IP is 209.222.82.143) smtp.mailfrom=Danielle378.onmicrosoft.com; dkim=fail (body hash did not verify) header.d=paypal.com;dmarc=fail action=oreject header.from=paypal.com;compauth=none reason=451|
|Received-SPF|Fail (protection.outlook.com: domain of bbunny378.onmicrosoft.com does not designate 209.222.82.143 as permitted sender) receiver=protection.outlook.com; client-ip=209.222.82.143; helo=outbound-ip122b.ess.barracuda.com;|
|DKIM-Signature|v=1; a=rsa-sha256; d=paypal.com; s=pp-dkim1; c=relaxed/relaxed; q=dns/txt; i=@paypal.com; t=1724681744; h=From:From:Subject:Date:To:MIME-Version:Content-Type; bh=QAx3vqqhWgVnrGUcDi7Oo1ydwDuOHlIzBFxro/aNaEQ=; b=z6tydmN+RWp+f9nRGjcmb5wGtlTrUrBxKvd2eyXajuy4+AIMMAC54z9toRraR8G4 htGJQflq+eoi04a1wJBfyg0qS0O2VtSwBLmSNWliS+whFzRowrvAQaA+MPRzOevX XI/ujTc/MEGTliEWmCYemlQd4z23HmzzvX05UzSA08Khxe0dCLARKDiO9sN3yaZA h8NIxiqUpYLdvTDMjmg1M004Mr9rZ5QCuqnzzq3cDN/P530rTEMmllq4Ur115iP5 2ugHhDEmL6KQldpJO01YH2CajtyAciD94AaXblWDNteMvJKklNOyK8EooArapEzY znqJEQaxUWLItcU0RU0Jcg==;|
|Content-Transfer-Encoding|quoted-printable|
|Content-Type|text/html; charset="UTF-8"|
|Date|Fri, 12 Dec 2025 10:36:44 -0700|
|Message-ID|<7B.C4.04011.01E8CC66@ccg13mail05>|
|Subject|Invoice from Santa Claus (4103)|
|To|"naeryn@tbfc.com" <naeryn@tbfc.com>|
|From|"service@paypal.com" <service@paypal.com>|
|Return-Path|bounces+SRS=qVbic=PZ@bbunny378.onmicrosoft.com|
|MIME-Version|1.0|

SS2
<img width="1297" height="513" alt="ss2" src="https://github.com/user-attachments/assets/843796b6-3cd9-4051-99fe-41a6b63b7f1b" />

A lot of the authentication protocols fail and the return path is to a different address.
(spf = fail, dkim = fail, dmarc = fail, received spf = fail)

SS3 
<img width="1295" height="527" alt="ss3" src="https://github.com/user-attachments/assets/f75cb951-c6e2-4fb6-b1d8-fee9f20d0559" />

We can classify this as phishing with the following signals: sense of urgency, fake invoice, spoofing

SS4
<img width="1316" height="456" alt="ss4" src="https://github.com/user-attachments/assets/664ac101-3ee3-45d5-9b45-375d3bcc225e" />

---

Email 2 - New Audio Message from McSkidy

SS5
<img width="1860" height="851" alt="ss5" src="https://github.com/user-attachments/assets/2c760c7e-f2db-4771-adc4-4bf1335e5ed3" />

The message overview seems fine, there is a suspicious attachment which is a .html file when we were expecting an audio file. 

SS6
<img width="1322" height="251" alt="ss6" src="https://github.com/user-attachments/assets/e6d4fa2c-5044-48b6-bad0-e4399c708ac1" />

The headers are"

|   |   |
|---|---|
|Received|from DU2PR08MB10188.eurprd08.prod.outlook.com (2603:10a6:10:46f::12) by AM9PR08MB6004.eurprd08.prod.outlook.com with HTTPS; Fri, 12 Dec 2025 11:55:03 +0000|
|Received|from AS9PR04CA0039.eurprd04.prod.outlook.com (2603:10a6:20b:46a::33) by DU2PR08MB10188.eurprd08.prod.outlook.com (2603:10a6:10:46f::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Fri, 12 Dec 2025 11:53:15 +0000|
|Received|from AMS0EPF0000014F.eurprd05.prod.outlook.com (2603:10a6:20b:46a:cafe::22) by AS9PR04CA0039.outlook.office365.com (2603:10a6:20b:46a::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend Transport; Fri, 12 Dec 2025 11:53:12 +0000|
|Authentication-Results|spf=fail (sender IP is 173.243.133.97) smtp.mailfrom=tbfc.com; dkim=fail (signature did not verify) header.d=tbfc.com;dmarc=fail action=none header.from=tbfc.com;compauth=none reason=405|
|Received-SPF|Fail (protection.outlook.com: domain of transitioning tbfc.com discourages use of 173.243.133.97 as permitted sender)|
|Received|from gw3097.weakmail.com (173.243.133.97) by AMS0EPF0000014F.mail.protection.outlook.com (10.167.16.251) with Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7897.11 via Frontend Transport; Fri, 12 Dec 2025 11:53:12 +0000|
|Authentication-Results-Original|gw3097.weakmail.com; spf=permerror (weakmail.com: 143.55.232.2 is neither permitted nor denied by domain of bounce+35b744.72834a-calls.com@tbfc.com) smtp.mailfrom=bounce+35b744.72834a-calls.com@tbfc.com; dkim=pass header.i=@tbfc.com;|
|DKIM-Signature|a=rsa-sha256; v=1; c=relaxed/relaxed; d=tbfc.com; q=dns/txt; s=k1; t=1724068357; x=1724075557; h=Date: Message-ID: Reply-To: Subject: Subject: From: From: To: To: MIME-Version: Content-Type: Sender: Sender; bh=1hyA4Zf4UdXyZQc/DeMDyIR/aSSwcpbJiVyJDmICRf8=; b=McN4GKhl/iGM4CE5jLkj+uRdimBAEQy6PZNZmk+z3zRBD1iVRhyjiEgHssl/4ySAucnw62yRUuq7ybYwVjO9BBnu+wDpqH9XNTZ2CFnxNDyXcSo4d6V2R7Slw/FZJckToLLrJPDCgS2akm5Zl48ItvtYPoH1I+820FqJDFKHJYI=|
|Sender|calls@tbfc.com|
|Content-Type|multipart/related; boundary="===============1384656496240588532=="|
|To|tarron@tbfc.com|
|From|McSkidy Missed Call Notifier <calls@tbfc.com>|
|Subject|New Audio Message from McSkidy|
|Reply-To|TBFC <noreply@tbfc.com>|
|Message-ID|<172406835482.169035.18309037092888188755@27-tyral>|
|Date|Sun, 12 Oct 2025 18:12:34 +0000|
|Return-Path|zxwsedr@easterbb.com|
|MIME-Version|1.0|

The authentication protocols fail, the received spf fails, and the return path does not match the sending address.

We can classify this email as phishing with the signals: impersonation, spoofing, and malicious attachment

SS7
<img width="1300" height="440" alt="ss7" src="https://github.com/user-attachments/assets/421e38f1-5fd1-4619-b60e-6ac96f5d3d7d" />

---

Email 3 - URGENT: McSkidy VPN access for incident response

Off the bat, the title of the email has a fully capitalized "URGENT" which is an immediate red flag.

SS8
<img width="1857" height="846" alt="ss8" src="https://github.com/user-attachments/assets/3cf7f941-58ef-4c96-ae3b-31ec971ca6b2" />

The content of the email is also creating a sense of urgency with many calls to action. There is also the fact that the email is a personal gmail account and they are asking for credentials to be sent through email which is a red flag. It also appears to be impersonating McSkidy.

The headers:

|   |   |
|---|---|
|Received|from DU0PR01MB9023.eurprd01.prod.exchangelabs.com (2603:10a6:10:35a::19) by DU2PR01MB8429.eurprd01.prod.exchangelabs.com with HTTPS; Fri, 14 Dec 2025 04:05:13 +0000|
|Received|from AS9PR06CA0298.eurprd06.prod.outlook.com (2603:10a6:20b:45a::6) by DU0PR01MB9023.eurprd01.prod.exchangelabs.com (2603:10a6:10:35a::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Fri, 14 Dec 2025 04:05:11 +0000|
|Received|from AM2PEPF0001C70C.eurprd05.prod.outlook.com (2603:10a6:20b:45a:cafe::35) by AS9PR06CA0298.outlook.office365.com (2603:10a6:20b:45a::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend Transport; Fri, 14 Dec 2025 04:05:10 +0000|
|Received|from mail-wm1-f67.google.com (209.85.128.67) by AM2PEPF0001C70C.mail.protection.outlook.com (10.167.16.200) with Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7849.8 via Frontend Transport; Fri, 14 Dec 2025 04:05:10 +0000|
|Received|from 341605307468 named unknown by gmailapi.google.com with HTTPREST; Fri, 14 Dec 2025 04:05:09 +0000|
|Authentication-Results|spf=pass (sender IP is 209.85.128.67) smtp.mailfrom=gmail.com; dkim=pass (signature was verified) header.d=gmail.com;dmarc=pass header.from=gmail.com;compauth=pass reason=111|
|Received-Spf|Pass (protection.outlook.com: domain of gmail.com designates 209.85.128.67 as permitted sender) receiver=protection.outlook.com; client-ip=209.85.128.67; helo=mail-wm1-f67.google.com; pr=C|
|Dkim-Signature|v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=google; t=1723608310; x=1724213110; darn=gmail.com; h=to:subject:message-id:date:mime-version:from:user-agent:in-reply-to :references:from:to:cc:subject:date:message-id:reply-to; bh=JPDbPId0FhMLkx73Fa1XuTA6b3dKaoyqn+GhtJVVee8=; b=kJMBe6v7T9QfTTit+Mgzzz6yhBWoJ5CD5kzCtfRBMD7ashn/0Z6/IPJK9Z/oIUsdZc IxbB/maStZuBudhionCY3YhpHaZWLPlXBPxTT5dEJwirMhaGJO5FQfeWecRKrjHsrd+p 9Y4sB3iKAvKWrKTtsEw1uAQU7n/V9tELTcD/jFYWPEOpNQLwemT2gQPfakGOWM37jCwr o32pw2LBAeKZmxw9jZ4HI0csFdC1OQ/VicCdmrXVB51bze2aRyAqDtGap4oYWV3C9ZcG L/F/yTg1gNYO19mrFbfgv230pCkwaPPE3DGSG/DDxSIKSSNebp8AOcJ1Jy/kJAvM4B3F 2JcA==|
|In-Reply-To|<CAGVzd0Ec0WvV-YdSDHasdhm2d4JX9PsE8XSzrkNFB20Qd-MwENQ@mail.gmail.com>|
|From|McSkidy <mcskiddyy202512@gmail.com>|
|MIME-Version|1.0|
|Date|Sun, 14 Dec 2025 04:05:09 +0000|
|Message-Id|<CAGVzd0ERMObw8GhH+bMsXYkKdFyfHL0npp+mM04e1GJonK44wg@mail.gmail.com>|
|Subject|URGENT: McSkidy VPN access for incident response|
|To|TBFC Blue Team <blueteam@tbfc.com>|
|Content-Type|multipart/mixed; boundary="----sinikael-?=_1-17236083563470.6207944771923966"|
|Return-Path|mcskiddyy202512@gmail.com|
|Content-Transfer-Encoding|7bit|

The headers looks fine, the authentication protocols pass and the received spf passes. The return path matches the sender address, but again, it appears to be a personal email address. 

We can classify this as phishing with the signals: Impersonation, social engineering text, sense of urgency.

SS9
<img width="1287" height="382" alt="ss9" src="https://github.com/user-attachments/assets/3c29c4ec-7b99-4fbe-9cf1-d984cab79aff" />

---

Email 4 - TBFC HR Department shared "Annual Salary Raise Approval.pdf" with you

SS10
<img width="1857" height="881" alt="ss10" src="https://github.com/user-attachments/assets/7d3e33b8-ccb9-42e7-aed3-7c928b736e05" />

SS11
<img width="685" height="662" alt="ss11" src="https://github.com/user-attachments/assets/82b712c6-b1b9-4828-aacc-288052f35212" />


The attachment looks fairly suspicious, especially the file name: https://www.dropbox.com/scl/fi/xzruzfwqa4w77ozxvq00i/annual-salary-raise-approval.pdf?blablablabla

The headers are:

|   |   |
|---|---|
|Received|from CYYPR12MB8853.namprd12.prod.outlook.com (::1) by BN8PR12MB4978.namprd12.prod.outlook.com with HTTPS; Fri, 12 Dec 2025 21:00:27 +0000|
|Received|from PR3PR09CA0015.eurprd09.prod.outlook.com (2603:10a6:102:b7::20) by CYYPR12MB8853.namprd12.prod.outlook.com (2603:10b6:930:cb::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.21; Fri, 12 Dec 2025 21:00:25 +0000|
|Received|from PR3PR01MB6764.eurprd01.prod.exchangelabs.com (2603:10a6:102:b7:cafe::73) by PR3PR09CA0015.outlook.office365.com (2603:10a6:102:b7::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21 via Frontend Transport; Fri, 12 Dec 2025 21:00:24 +0000|
|Received|from DU2P250CA0005.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::10) by PR3PR01MB6764.eurprd01.prod.exchangelabs.com (2603:10a6:102:69::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 12 Dec 2025 21:00:19 +0000|
|Received|from DB1PEPF0003922F.eurprd03.prod.outlook.com (2603:10a6:10:231:cafe::ff) by DU2P250CA0005.outlook.office365.com (2603:10a6:10:231::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30 via Frontend Transport; Fri, 12 Dec 2025 21:00:19 +0000|
|Received|from a60-157.smtp-out.us-west-2.amazonses.com (54.240.60.157) by DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.15 via Frontend Transport; Fri, 12 Dec 2025 21:00:18 +0000|
|Authentication-Results|spf=pass (sender IP is 54.240.60.157) smtp.mailfrom=email.dropbox.com; dkim=pass (signature was verified) header.d=dropbox.com;dkim=pass (signature was verified) header.d=amazonses.com;dmarc=pass action=none header.from=dropbox.com;compauth=pass reason=100|
|Received-Spf|Pass (protection.outlook.com: domain of email.dropbox.com designates 54.240.60.157 as permitted sender) receiver=protection.outlook.com; client-ip=54.240.60.157; helo=a60-157.smtp-out.us-west-2.amazonses.com; pr=C|
|Dkim-Signature|v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=b55ck4kgrdgjxhl3qlcrbmzyg4d26eak; d=dropbox.com; t=1717016416; h=Content-Type:MIME-Version:From:To:CC:Subject:Date:Message-ID:Reply-To; bh=43982798473YTHIUERHGC99842374HWECRUHEW9R8EWRUCW==; b=dsf s7s7f98dsfds7fs98dfusd8fuds8fud8sfcjsd==|
|Dkim-Signature|v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717016416; h=Content-Type:MIME-Version:From:To:CC:Subject:Date:Message-ID:Reply-To:Feedback-ID; bh=fsdjknfskjdfnsdjkfns32424234jk23b4kh==; b=fihsdufys86r4yt386rh3r8hf3789qhf8fh38hf63823uhei2hjwehdfjwfhiywgfuyg2863b==|
|Content-Type|multipart/mixed; boundary="----sinikael-?=_1-17170166112790.013752983326257961"|
|MIME-Version|1.0|
|From|TBFC HR Department <no-reply@dropbox.com>|
|To|Neymar Junior <neymar.junior@tbfc.com>|
|Subject|TBFC HR Department shared "Annual Salary Raise Approval.pdf" with you|
|Date|Fri, 12 Dec 2025 21:00:16 +0000|
|Message-Id|3612436312273@us-west-2.amazonses.com|
|Reply-To|hr.tbfc@outlook.com|
|Return-Path|345675444334263@email.dropbox.com|

The authentication protocols pass, but the reply-to address seems like a false domain, as tbfc.com should be the companys domain, not outlook. They are using an external email domain instead of the internal company domain.

We can classify this email as phishing with the signals: impersonation, external sender domain, social engineering text

SS12
<img width="1282" height="392" alt="ss12" src="https://github.com/user-attachments/assets/c3abea23-673b-47fa-8c45-2ad1ac0392ad" />

---

Email 5 -  Improve your event logistics this SOC-mas season

SS13
<img width="1863" height="962" alt="ss13" src="https://github.com/user-attachments/assets/00b886f0-8aaf-4e88-a2be-b1a34cf2ce10" />

The content doesn't look suspicious, just kind of spammy marketing email.

The headers are:

|   |   |
|---|---|
|Received|from DU0PR01MB9023.eurprd01.prod.exchangelabs.com (2603:10a6:10:35a::19) by DU2PR01MB8429.eurprd01.prod.exchangelabs.com with HTTPS; Wed, 14 Aug 2024 04:05:13 +0000|
|Received|from AS9PR06CA0298.eurprd06.prod.outlook.com (2603:10a6:20b:45a::6) by DU0PR01MB9023.eurprd01.prod.exchangelabs.com (2603:10a6:10:35a::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug 2024 04:05:11 +0000|
|Received|from AM2PEPF0001C70C.eurprd05.prod.outlook.com (2603:10a6:20b:45a:cafe::35) by AS9PR06CA0298.outlook.office365.com (2603:10a6:20b:45a::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend Transport; Wed, 14 Aug 2024 04:05:10 +0000|
|Received|from mail-wm1-f67.google.com (209.85.128.67) by AM2PEPF0001C70C.mail.protection.outlook.com (10.167.16.200) with Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7849.8 via Frontend Transport; Wed, 14 Aug 2024 04:05:10 +0000|
|Received|by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-427fc97a88cso47415525e9.0 for <shafkath_nur@tbfc.com>; Tue, 13 Aug 2024 21:05:10 -0700 (PDT)|
|Received|from 341605307468 named unknown by gmailapi.google.com with HTTPREST; Wed, 14 Aug 2024 04:05:09 +0000|
|Received|from 83.72.202.35.bc.googleusercontent.com (83.72.202.35.bc.googleusercontent.com [35.202.72.83]) by api.nylas.com (Nylas) with HTTPREST id cnk1mfnwhrxc7kuiwnzjgdzti-0; Wed, 14 Aug 2024 04:03:50 +0000 (UTC)|
|Authentication-Results|spf=pass (sender IP is 209.85.128.67) smtp.mailfrom=tewsworks.net; dkim=pass (signature was verified) header.d=tewsworks.net;dmarc=none action=none header.from=tewsworks.net;compauth=pass reason=111|
|Received-Spf|Pass (protection.outlook.com: domain of tewsworks.net designates 209.85.128.67 as permitted sender) receiver=protection.outlook.com; client-ip=209.85.128.67; helo=mail-wm1-f67.google.com; pr=C|
|Dkim-Signature|v=1; a=rsa-sha256; c=relaxed/relaxed; d=tewsworks.net; s=google; t=1723608310; x=1724213110; darn=tbfc.com; h=to:subject:message-id:date:mime-version:from:user-agent:in-reply-to :references:from:to:cc:subject:date:message-id:reply-to; bh=JPDbPId0FhMLkx73Fa1XuTA6b3dKaoyqn+GhtJVVee8=; b=kJMBe6v7T9QfTTit+Mgzzz6yhBWoJ5CD5kzCtfRBMD7ashn/0Z6/IPJK9Z/oIUsdZc IxbB/maStZuBudhionCY3YhpHaZWLPlXBPxTT5dEJwirMhaGJO5FQfeWecRKrjHsrd+p 9Y4sB3iKAvKWrKTtsEw1uAQU7n/V9tELTcD/jFYWPEOpNQLwemT2gQPfakGOWM37jCwr o32pw2LBAeKZmxw9jZ4HI0csFdC1OQ/VicCdmrXVB51bze2aRyAqDtGap4oYWV3C9ZcG L/F/yTg1gNYO19mrFbfgv230pCkwaPPE3DGSG/DDxSIKSSNebp8AOcJ1Jy/kJAvM4B3F 2JcA==|
|In-Reply-To|<candycane-co.wv>|
|User-Agent|Nylas-Amplemarket/18.1.0|
|From|Lara <lara@candycane-co.wv>|
|MIME-Version|1.0|
|Date|Sun, 14 Dec 2025 04:05:09 +0000|
|Message-Id|<CAGVzd0ERMObw8GhH+bMsXYkKdFyfHL0npp+mM04e1GJonK44wg@mail.gmail.com>|
|Subject|Improve your event logistics this SOC-mas season|
|To|TBFC Events <events@tbfc.com>|
|Content-Type|multipart/mixed; boundary="----sinikael-?=_1-17236083563470.6207944771923966"|
|Return-Path|candycane-co.wv|
|Content-Transfer-Encoding|7bit|

The return path matches and the authentication protocols pass.

This would be classified as a spam email

SS14
<img width="1092" height="141" alt="ss14" src="https://github.com/user-attachments/assets/07e2f74f-1f60-4a9c-a7dd-49ffb1d5b7bc" />

--- 

Email 6 - TBFC-IT shared "Christmas Laptop Upgrade Agreement" with you

SS15
<img width="1867" height="871" alt="ss15" src="https://github.com/user-attachments/assets/3b4d559b-b0ec-41e9-bf57-34fa4c170e43" />

Immediately we see the from address: TBFC-IT <tbfc-it@tbƒc.com>
uses a latin character for 'f' so this is potential typosquatting/punycodes

There is an attached file, but no real context in the message content. 

The headers are:

|   |   |
|---|---|
|Received|from SJ1PR12MB6028.namprd12.prod.outlook.com (2603:10b6:a03:489::8) by BN8PR12MB4980.namprd12.prod.outlook.com with HTTPS; Fri, 12 Dec 2025 17:29:47 +0000|
|Received|from DB9PR01CA0021.eurprd01.prod.exchangelabs.com (2603:10a6:10:1d8::26) by SJ1PR12MB6028.namprd12.prod.outlook.com (2603:10b6:a03:489::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Fri, 12 Dec 2025 17:29:45 +0000|
|Received|from DB9PR01MB10075.eurprd01.prod.exchangelabs.com (2603:10a6:10:1d8:cafe::1) by DB9PR01CA0021.outlook.office365.com (2603:10a6:10:1d8::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.34 via Frontend Transport; Fri, 12 Dec 2025 17:29:44 +0000|
|Received|from DB8PR06CA0016.eurprd06.prod.outlook.com (2603:10a6:10:100::29) by DB9PR01MB10075.eurprd01.prod.exchangelabs.com (2603:10a6:10:30a::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Fri, 12 Dec 2025 17:29:41 +0000|
|Received|from DB3PEPF0000885B.eurprd02.prod.outlook.com (2603:10a6:10:100:cafe::76) by DB8PR06CA0016.outlook.office365.com (2603:10a6:10:100::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.32 via Frontend Transport; Fri, 12 Dec 2025 17:29:41 +0000|
|Received|from dispatch1-us1.ppe-hosted.com (148.163.129.48) by DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15 via Frontend Transport; Fri, 12 Dec 2025 17:29:40 +0000|
|Received|from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173]) (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits)) (No client certificate requested) by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 262CC60007C for <savoys@tbfc.com>; Fri, 12 Dec 2025 17:29:37 +0000 (UTC)|
|Received|from DS0PR06MB9272.namprd06.prod.outlook.com (2603:10b6:8:129::21) by BL4PR06MB9684.namprd06.prod.outlook.com (2603:10b6:208:4dc::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.22; Fri, 12 Dec 2025 17:29:34 +0000|
|Received|from DS0PR06MB9272.namprd06.prod.outlook.com ([fe80::297f:3d1e:7d4d:6b52]) by DS0PR06MB9272.namprd06.prod.outlook.com ([fe80::297f:3d1e:7d4d:6b52%4]) with mapi id 15.20.7698.014; Fri, 12 Dec 2025 17:29:34 +0000|
|From|TBFC-IT <tbfc-it@tbƒc.com>|
|To|Savoy <savoys@tbfc.com>|
|Subject|TBFC-IT shared "Christmas Laptop Upgrade Agreement" with you|
|Date|Fri, 12 Dec 2025 17:29:34 +0000|
|Accept-Language|en-US|
|Content-Language|en-US|
|received-spf|Pass (protection.outlook.com: domain of tbƒc.com designates 148.163.129.48 as permitted sender) receiver=protection.outlook.com; client-ip=148.163.129.48; helo=dispatch1-us1.ppe-hosted.com; pr=C|
|authentication-results|spf=pass (sender IP is 148.163.129.48) smtp.mailfrom=tbƒc.com; dkim=pass (signature was verified) header.d=NETORGFT5333146.onmicrosoft.com;dmarc=none action=none header.from=tbƒc.com;compauth=pass reason=109|
|dkim-signature|v=1; a=rsa-sha256; c=relaxed/relaxed; d=NETORGFT5333146.onmicrosoft.com; s=selector1-NETORGFT5333146-onmicrosoft-com; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck; bh=VpUaEZsM02olFjPbW9CqXrwP+IlK++M1QazeU9FUD7c=; b=Ebcwp+HuNVOehTJhb55dRU4XvieFAmSt+8jC7a2yTtUpDrWtjljjuqVMir1PfVtI1Q0S87xX0ndPbVoMI+3SQZGJEJDhR+RUepuEGGG9R/hAWdcpVKK9ooLtgqLoEO5swHYj4zpi3vTbgzZnsu2xUQYOv5/yo/R3Bx5QKhJFehg=|
|authentication-results-original|dkim=none (message not signed) header.d=none;dmarc=none action=none header.from=tbƒc.com;|
|Content-Type|multipart/related; boundary="_007_Shared38d34a130c05000ccea71df3ea86d641af84506f8b848fb9e_"; type="multipart/alternative"|
|Return-Path|tbfc-it@xn--tbc-n5a.com|
|MIME-Version|1.0|

The authentication protocols pass, but the return path does not match the sender address.

We can classify this email as phishing with the signals: impersonation, typosquatting/punycodes, and social engineering text.

SS16
<img width="1245" height="371" alt="ss16" src="https://github.com/user-attachments/assets/97a990c8-8f44-46fc-a1b5-8cbebf147ca3" />

