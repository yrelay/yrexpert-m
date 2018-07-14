;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%NLSMISC^INT^1^58140,5734^0
%NLSMISC ; NLS miscellaneous ; JLC062 11/23/98  ; Compiled March 6, 2000 19:35:34
 ;%ShmObj.INC ; CFL204 12/11/98 
 Quit
LoadISO(name,file) New (name,file,desc) Set $ZT="G %LoadISOERROR"
 Set ref=$name(^%nls("Src","XLT",name,"Unicode")) Kill @ref
 Set @ref="Loaded "_name_" to Unicode Translation"
 Set @ref@(0)=0
 Set @ref@(1)=1
 Set @ref@(2)=0
 Set @ref@(4)=name_"-Unicode"
 Set ref=$name(^%nls("Src","XLT","Unicode",name)) Kill @ref
 Set @ref="Generated Unicode to "_name_" Translation"
 Set @ref@(0)=0
 Set @ref@(1)=2
 Set @ref@(2)=0
 Set @ref@(4)="Unicode-"_name
 Set src=$name(^%nls("Src","SUB",name_"-Unicode")) Kill @src
 Set @src="Loaded "_name_" to Unicode Table"
 Set @src@(0)=0,src=$name(@src@(1))
 o file:"R" Set $ZT="G %LoadISOEOF"
 For  u file r x Set x=$p(x,"#") Set:x'="" @src@($zh($p($p(x,$c(9),1),"0x",2)))=$zh($p($p(x,$c(9),2),"0x",2))
%LoadISOEOF Set $ZT="G %LoadISOERROR" c file u 0
 For from=0:1:159 Set:'$d(@src@(from)) @src@(from)=from
 Set dst=$name(^%nls("Src","SUB","Unicode-"_name)) Kill @dst
 Set @dst="Generated Unicode to "_name_" Table"
 Set @dst@(0)=0,dst=$name(@dst@(1))
 Set from="" For  Set from=$o(@src@(from)) Quit:from=""  Set @dst@(@src@(from))=from
 Quit
%LoadISOERROR u 0 Write $ze,! Quit
AllISO(dir) New (dir)
 Set nam="Latin1;Latin2;Latin3;Latin4;Cyrillic;Arabic;Greek;Hebrew;Latin9"
 For i=2:1:9 Do LoadISO($p(nam,";",i),$ZU(12,dir)_"8859-"_i_".txt")
 Quit
Dump Do DispIOName,DispXYName,DispCOL,DispDefault,DispIODef,DispXYDef
 Do DispIOSlot,DispXYSlot,DispProc,DispIOProc,DispXYProc Quit
DispIOName Do DispHdr1("I/O Table Name") Write !
 New  Set tab=$V((0)*$ZU(40,0,25)+($ZU(40,2,103)),-2,$ZU(40,0,25)),nam=""
 For  Set nam=$ZU(127,2,tab,nam) Quit:nam=""  Do DispNamEle(tab,nam,2)
 Quit
DispXYName Do DispHdr1("$X/$Y Table Name") Write !
 New  Set tab=$V((1)*$ZU(40,0,25)+($ZU(40,2,103)),-2,$ZU(40,0,25)),nam=""
 For  Set nam=$ZU(127,2,tab,nam) Quit:nam=""  Do DispNamEle(tab,nam,1)
 Quit
DispDefault Do DispDef("Default",$ZU(40,2,104),"Pattern,Ident,UpperCase,LowerCase,TitleCase",4,-2) Quit
DispIODef Do DispTab("I/O Default",$ZU(40,2,105),"Process,Direct Term,Telnet/LAT,File,Magtape,Network,DSM-DDP,DTM-DCP,SysCalls",8,-2) Quit
DispXYDef Do DispTab("$X/$Y Default",$ZU(40,2,106),"Process",0,-2) Quit
DispIOProc Do DispTab("Process I/O",$ZU(40,1,27),"Process,Direct Term,Telnet/LAT,File,Magtape,Network,DSM-DDP,DTM-DCP,SysCalls",8,-1) Quit
DispXYProc Do DispTab("Process $X/$Y",$ZU(40,1,28),"Process",0,-1) Quit
DispIOSlot Do DispSlots("I/O Slots",$ZU(40,2,107)) Quit
DispXYSlot Do DispSlots("$X/$Y Slots",$ZU(40,2,108)) Quit
DispProc Do DispDef("Process",$ZU(40,1,26),"Pattern,Ident,UpperCase,LowerCase,TitleCase",4,-1) Quit
DispCOL Do DispHdr1("Collation Table") Write !
 New  Set max=$zu(83)
 For col=0:1:255 Set rul=$zu(23,2,col) If $p(rul,"^",1,2)'="255^255" Do
 . Set num=$p(rul,"^",3)
 . If num Do
 . . Set offs=$zu(83,num),dec=+$p(offs,",",2),enc=+offs If enc!dec Do
 . . . Write $j(col,3),?16-5,"Enc",?16,$$DispOff(enc),?34,$$GetOffSrc(enc),!
 . . . Write ?16-5,"Dec",?16,$$DispOff(dec),?34,$$GetOffSrc(dec),!
 . Else  Do
 . . Write $j(col,3),?16-5,"Enc",?16,"  " Do  Write !
 . . . If col<6 Write $p("Old ANSI^New ANSI^^^^Unicode","^",col+1)
 . . . Else  If col#128<6 Write $p("Old string^New string^^^^Unicode string","^",col-127)
 . . . Else  Write "???"
 . . Write ?16-5,"Dec",!
 Quit
DispDef(hdr,base,names,max,typ) New i,off Do DispHdr1(hdr)
 For i=0:1:max Set off=$V((i)*$ZU(40,0,25)+(base),typ,$ZU(40,0,25)) Write !,$p(names,",",i+1) Do:off
 . Write ?16,$$DispOff(off),?34,$$GetOffSrc(off)
 Write ! Quit
DispTab(hdr,base,names,max,typ) New i,off Do DispHdr(hdr,"Name","----")
 For i=0:1:max Set off=$V((i)*$ZU(40,0,25)+(base),typ,$ZU(40,0,25)) Write !,$p(names,",",i+1) Do:off
 . Write ?16,$$DispOff(off),?34,$ZU(126,5,off)
 Write ! Quit
DispSlots(hdr,base) New i,off Set off=0
 For i=0:1:9 Set off(i)=$V((i)*$ZU(40,0,25)+(base),-2,$ZU(40,0,25)) Set:off(i) off=1
 If 'off Write !,hdr,?16,"  All Empty",! Quit
 Do DispHdr1(hdr) For i=0:1:9 Write !,i Do:off(i)
 . Write ?16,$$DispOff(off(i)),?34,$ZU(126,5,off(i))
 Write ! Quit
DispNamEle(tab,nam,ele) New i Set ele(0)=0
 For i=1:1:ele Set ele(i)=$ZU(127,1,tab,nam,i) Set:ele(i) ele(0)=1
 Write nam If 'ele(0) Write ?16-2,"Empty",! Quit
 For i=1:1:ele Do:ele(i)
 . w:ele-1 ?16-5,$P("In,Out",",",i)
 . Write ?16,$$DispOff(ele(i)),?34,$$GetOffSrc(ele(i)),!
 Quit
DispOff(off) Quit $J($ZH($ZU(126,4,off)),8)_":"_$p("Invalid,byte,uint2,uint4,uint8,ByteStr,WordStr,Struct4,Struct8,StructOFF,Page1,Page2,Page4,Page8,Packed2,Packed4,Packed8,PakWrd4,PakWrd8,PageOff",",",$ZU(126,3,off)+1)
DispHdr1(lab) Do DispHdr(lab,"Source Global","-------------") Quit
DispHdr(lab,hdr,lin) Write !,lab,?16,"  Offset:Type",?34,hdr,!,$TR($J("",$L(lab))," ","-"),?16,"  -------------",?34,lin Quit
GetOffSrc(off) New (off) Set oid=+$o(^%shm("Off",1,off,"")) Quit:'oid ""
 Set nam=$q(^%shm("Src",0,oid)) Quit:$qs(nam,2)'=0 "" Quit:$qs(nam,3)'=oid ""
 Set res=$qs(nam,4)_"("_$c(34)_"Src"_$c(34)_","
 For i=5:1:$ql(nam) Set res=res_""""_$qs(nam,i)_""","
 Quit $E(res,1,$L(res)-1)_")"

