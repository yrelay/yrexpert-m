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

;%NLSCOMP^INT^1^58140,5734^0
%NLSCOMP   ; FULLNLS compiler ; JLC178 11/30/99  ; Compiled March 6, 2000 19:35:34
 ;%ShmObj.INC ; CFL204 12/11/98 
 Quit
Table(ttyp,fromenc,name,sref) New oid,ref,t1 Set $zt="G %CompERROR" Set t1=$zh
 Set:'$d(sref) sref="^%nls"
 Kill ^%utility($j) Set ref=$name(@sref@("Src",ttyp,fromenc,name))
 If $e($g(@ref),1,8)="Built-in" Write:$d(^%nlsmisc("DEBUG")) "Built-in   ",ref,! Quit -1
 If $d(@ref)<10 Write:$d(^%nlsmisc("DEBUG")) "Not loaded ",ref,! Quit -2
 Do %XLT:ttyp="XLT"!(ttyp["Case"),%Ident:ttyp="Ident",%Pattern:ttyp="Pattern",%XY:ttyp="XY",%COL:ttyp="COL"
 If '$g(oid) Write:$d(^%nlsmisc("DEBUG")) !,"Unable to create "_$s($g(ttyp)="XLT":"Translation",$g(ttyp)="XY":"$X/$Y Behaviour",$g(ttyp)="Ident":"Identifier",$g(ttyp)="Pattern":"Pattern Match",$g(ttyp)="UpperCase":"Upper case",$g(ttyp)="LowerCase":"Lower case",$g(ttyp)="TitleCase":"Title case",1:"Collation")_" table "_$g(fromenc)_" to "_$g(name)_"." Quit 0
 If oid=-2 Write:$d(^%nlsmisc("DEBUG")) "Not loaded ",ref,! Quit -2 ; JLC078
 Set ^%shm("Src",0,oid,"%nls",ttyp,fromenc,name)=""
 Set ^%shm("Src",1,"%nls",ttyp,fromenc,name,oid)=""
 Write:$d(^%nlsmisc("DEBUG")) "Compiled   ",ref," in ",$ZH-t1," seconds",!
 Quit oid
Locale(loc,sref) New nam,num,typ,rtyp,from,to,ref,oid,charset
 Set:'$d(sref) sref="^%nls"
 Set charset=$g(^%nls("Loc",loc,0))
 If charset="" Quit 0
 Set num=0,ref=$name(^%nls("Loc",loc,1)),typ=""
 For  Set typ=$o(@ref@(typ)) Quit:typ=""  Set nam="" Do
 . For  Set nam=$o(@ref@(typ,nam)) Quit:nam=""  Do
 . . If typ="Ident"!(typ="XY")!(typ="Pattern")!(typ["Case") Do
 . . . Set oid=$$Table(typ,charset,nam,sref) Set:oid num=num+1
 . . Else  If typ="XLT"!(typ="COL") Do
 . . . If $d(@ref@(typ,nam))<10 Set from=charset,to=nam Do
 . . . . Set oid=$$Table(typ,from,to,sref) Set:oid num=num+1
 . . . . Set oid=$$Table(typ,to,from,sref) Set:oid num=num+1
 . . . Else  Do
 . . . . Set from=$g(@ref@(typ,nam,0,0)),to=$g(@ref@(typ,nam,0,1))
 . . . . If from'="",to'="" Set oid=$$Table(typ,from,to,sref) Set:oid num=num+1
 . . . . Set from=$g(@ref@(typ,nam,1,0)),to=$g(@ref@(typ,nam,1,1))
 . . . . If from'="",to'="" Set oid=$$Table(typ,from,to,sref) Set:oid num=num+1
 Quit num
All New ttyp,fromenc,name,oid Set fromenc="",name=""
 For ttyp="Ident","XY","Pattern","XLT","COL","LowerCase","UpperCase","TitleCase" Do
 . For  Set fromenc=$o(^%nls("Src",ttyp,fromenc)) Quit:fromenc=""  Do
 . . For  Set name=$o(^%nls("Src",ttyp,fromenc,name)) Quit:name=""  Do
 . . . Set oid=$$Table(ttyp,fromenc,name)
 Quit
%Ident Set oid=$$%CompBITS($name(@ref@(0))) Quit
%Pattern If '$d(@ref@(1)) Set oid=-2 Quit
  New from,rng,i,lo,patcode,pattbl,val
 Set from="",patcode="",pattbl=@ref@(0),$ZT="G %XLTERROR"
 If '$d(@sref@("Src","Patcode",pattbl,0)) Set oid=-2 Quit  ; JLC078
 For  Set patcode=$o(@ref@(1,patcode)) Quit:patcode=""  Do
 . Set val=@sref@("Src","Patcode",pattbl,0,patcode)
 . For  Set from=$o(@ref@(1,patcode,from)) Quit:from=""  Set rng=^(from)  Do
 . . For i=from:1:from+rng-1 Set lo=i#256 Set ^(lo)=$zboolean(+val,+$g(^%utility($j,i\256,lo)),7)
 Set oid=$$%CompVAL($name(^%utility($j)),1) Quit
%XY New from,rng,i,dxy Set dxy="",from="",$ZT="G %XLTERROR"
 For  Set dxy=$o(@ref@(0,dxy)) Quit:dxy=""  Do
 . For  Set from=$o(@ref@(0,dxy,from)) Quit:from=""  Set rng=^(from) Do
 . . For i=from:1:from+rng-1 Set ^%utility($j,i\256,i#256)=dxy
 Set oid=$$%CompVAL($name(^%utility($j)),1) Quit
%XLT New obj,typ,act,com,val,err,tmp,byt,top,i,pag
 Set err=0,$ZT="G %XLTERROR",typ=@ref@(0)
 Goto %XLTNormal:typ=0,%XLTToModal:typ=1,%XLTFromModal:typ=2
%XLTERROR Do ErrMsg^%NLSLOAD("Error while trying to create "_$s($g(ttyp)="XLT":"Translation",$g(ttyp)="XY":"$X/$Y Behaviour",$g(ttyp)="Ident":"Identifier",$g(ttyp)="Pattern":"Pattern Match",$g(ttyp)="UpperCase":"Upper case",$g(ttyp)="LowerCase":"Lower case",$g(ttyp)="TitleCase":"Title case",1:"Collation")_" table "_$g(fromenc)_" to "_$g(name)_".")
 Quit
%XLTNormal Set oid=$$%CompSUB(@ref@(4),.byt,.top,.pag) Quit:oid<1
 Set typ=+$g(^%shm("Obj",oid)),obj(3)=oid,oid=0 Goto:$d(byt) %XLTPack
 Set act=+$g(@ref@(2))
 Set obj=9,com=($d(pag)=0)*2+(ttyp["Case")+1
 If act=2 Set obj(2)=+$g(@ref@(3)),val=3
 Else  Set val(0)=$$%CompStr($g(@ref@(3)),.val),obj(2)=$$Save^%ShmObj(.val) Quit:'obj(2)  Set val=^%shm("Obj",obj(2))
 Set obj(0)=$C(1,val,typ)
 Set obj(1)=$E($C(13,11,12,10),com)_$C(act)
 Set oid=$$Save^%ShmObj(.obj)
 Quit
%XLTPack Quit:'$d(top)  Quit:'top  Set obj(5)=top
 Set obj(1)=$C(14,+$g(@ref@(2)))
 Set val(0)=$$%CompStr($g(@ref@(3)),.val)
 Set obj(2)=$$Save^%ShmObj(.val) Quit:'obj(2)
 Set byt(0)=byt,byt=10,obj(4)=$$Save^%ShmObj(.byt) Quit:'obj(4)
 Set obj(0)=$C(1,^%shm("Obj",obj(2)),typ,^%shm("Obj",obj(4)),^%shm("Obj",top))
 Set obj=9 Set oid=$$Save^%ShmObj(.obj)
 Quit
%XLTToModal Set oid=$$%CompSUB(@ref@(4),.byt,.top,.pag) Quit:oid<1
 Set typ=+$g(^%shm("Obj",oid)),act=+$g(@ref@(2))
 Set obj=9,obj(3)=oid,oid=0
 Set val(0)=$$%CompStr($g(@ref@(3)),.val)
 Set obj(2)=$$Save^%ShmObj(.val) Quit:'obj(2)
 Set obj(1)=$C($S($d(pag)=0:16,1:17),act)
 Set act=$name(@sref@("Src","Mode",@ref@(5)))
 Set val(0)="",typ(0)=""
 For com=0:1:$o(@act@(1,""),-1) Do  Quit:err
 . Set val(0)=val(0)_$c(@act@(1,com))
 . Set tmp(0)=$$%CompStr(@act@(2,com),.tmp),typ(0)=typ(0)_$c(tmp)
 . Set typ(com+1)=$$Save^%ShmObj(.tmp) If 'typ(com+1) Set err=1 Quit
 Quit:err
 Set val=5,obj(4)=$$Save^%ShmObj(.val) Quit:'obj(4)
 Set typ=9,obj(5)=$$Save^%ShmObj(.typ) Quit:'obj(5)
 Set obj(0)=$C(1,^%shm("Obj",obj(2)),typ,^%shm("Obj",obj(4)),^%shm("Obj",obj(5)))
 Set oid=$$Save^%ShmObj(.obj)
 Quit
%XLTFromModal Set obj=9
 If '$d(@sref@("Src","Mode",@ref@(5),1)) Set oid=-2 Quit  ; JLC078
 Set val(0)=$$%CompStr($g(@ref@(3)),.val)
 Set obj(2)=$$Save^%ShmObj(.val) Quit:'obj(2)
 Set obj(0)=$C(1,^%shm("Obj",obj(2)),9,5,9)
 Set obj(1)=$C(15,+$g(@ref@(2)))
 Set act=$name(@sref@("Src","Mode",@ref@(5)))
 Set val(0)="",typ(0)="",com(0)=""
 For com=0:1:$o(@act@(1,""),-1) Do  Quit:err
 . Set val=+@act@(1,com),val(0)=val(0)_$c(val)
 . Set tmp(0)=$$%CompStr(@act@(2,com),.tmp),typ(0)=typ(0)_$c(tmp)
 . Set typ(com+1)=$$Save^%ShmObj(.tmp) If 'typ(com+1) Set err=1 Quit
 . Kill byt,top Set tmp=$$%CompSUB(@act@(0,com),.byt,.top)
 . If 'tmp Set err=2 Quit
 . Set com(0)=com(0)_$c(^%shm("Obj",tmp)),com(com+1)=tmp
 . If $d(byt) For i=1:1:256 If $A(byt,i),$A(byt,i)'=val Set err=3 Quit
 . If val=1,'$d(top),$d(byt) Set err=4 Quit
 . If val'=1,$d(top) Set err=5 Quit
 Quit:err
 Set com=9,obj(3)=$$Save^%ShmObj(.com) Quit:'obj(3)
 Set val=5,obj(4)=$$Save^%ShmObj(.val) Quit:'obj(4)
 Set typ=9,obj(5)=$$Save^%ShmObj(.typ) Quit:'obj(5)
 Set oid=$$Save^%ShmObj(.obj)
 Quit
%CompERROR Do ErrMsg^%NLSLOAD("Error while trying to create "_$s($g(ttyp)="XLT":"Translation",$g(ttyp)="XY":"$X/$Y Behaviour",$g(ttyp)="Ident":"Identifier",$g(ttyp)="Pattern":"Pattern Match",$g(ttyp)="UpperCase":"Upper case",$g(ttyp)="LowerCase":"Lower case",$g(ttyp)="TitleCase":"Title case",1:"Collation")_" table "_$g(fromenc)_" to "_$g(name)_".")
 Quit 0
%CompSUB(name,byt,top,pag) New (name,byt,top,pag,sref) Set typ=@sref@("Src","SUB",name,0)
 If '$d(@sref@("Src","SUB",name,1)) Quit -2         ; JLC078
 Goto %SUBSingle:typ=0,%SUBToCol:typ=5,%SUBFromCol:typ=6,%SUBMulti:typ=3
 Goto:$zboolean(+typ,+2,1) %SUBFromMulti
 Goto:$zboolean(+typ,+1,1) %SUBToMulti
 Write:$d(^%nlsmisc("DEBUG")) !,"Error - Table type: ",$P("Single,ToMulti,FromMulti,Multi",",",$zboolean(+typ,+3,1)+1)," not yet supported"
 Quit 0
%SUBSingle Set src=$name(@sref@("Src","SUB",name,1)),$ZT="G %CompERROR"
 If $o(@src@(""),-1)<256 Set pag=1 Quit $$%CompPAG(src)
 New obj,oid,i,dst Set i="",dst=$name(^%utility($j,"SUB")) Kill @dst
 For  Set i=$o(@src@(i)) Quit:i=""  Set @dst@(i\256,i#256)=@src@(i)
 Set obj=19,$p(obj(0),$c(0),257)=""
 For  Set i=$o(@dst@(i)) Quit:i=""  Set oid=$$%CompPAG($name(@dst@(i))) Do:oid
 . Set obj(i+1)=oid,$e(obj(0),i+1)=$c(^%shm("Obj",oid))
 If $o(obj(1))="" Set pag=1 Quit +$g(obj(1))
 Quit $$Save^%ShmObj(.obj)
%SUBToMulti Set src=$name(@sref@("Src","SUB",name,1)),$ZT="G %CompERROR"
 If $o(@src@(""),-1)<256 Set pag=1 Quit $$%CompPAGMulti(src,1)
 New obj,oid,i,dst Set i="",dst=$name(^%utility($j,"SUB")) Kill @dst
 For  Set i=$o(@src@(i)) Quit:i=""  Set @dst@(i\256,i#256)=@src@(i)
 Set obj=19,$p(obj(0),$c(0),257)=""
 For  Set i=$o(@dst@(i)) Quit:i=""  Set oid=$$%CompPAGMulti($name(@dst@(i)),'i) Do:oid
 . Set obj(i+1)=oid,$e(obj(0),i+1)=$c(^%shm("Obj",oid))
 If $o(obj(1))="" Set pag=1 Quit +$g(obj(1))
 Quit $$Save^%ShmObj(.obj)
%SUBFromMulti Set $ZT="G %CompERROR"
 Set src=$name(@sref@("Src","SUB",name,1)),lst=$o(@src@(""),-1) zt:lst>255 "COMP"
 Set ns=$ql(sref)
 Set $p(byt,$c(0),257)="",nod=src
 For  Set nod=$q(@nod) Quit:$qs(nod,ns+2)'="SUB"  Quit:$qs(nod,ns+3)'=name  Quit:$qs(nod,ns+4)>lst  Do
 . Set i=+$qs(nod,ns+5),len=$ql(nod)-ns-4
 . If '$a(byt,i+1) Set $e(byt,i+1)=$c(len)
 . Else  zt:$a(byt,i+1)'=len "COMP"
 For i=0:1:255 Set:$a(byt,i+1)=1 myval(i)=@src@(i)
 If $d(myval) Set top=$$%CompPAGMulti("myval")
 Set $p(obj(0),$c(0),257)=""
 For i=1:1:256 Set:$a(byt,i)>1 obj(i)=$$%CompLEV($a(byt,i),$name(@src@(i-1)))
 For i=1:1:256 Set:$d(obj(i)) $e(obj(0),i)=$c(^%shm("Obj",obj(i)))
 Set obj=19 Quit $$Save^%ShmObj(.obj)
%CompLEV(lev,ref) Quit:lev=2 $$%CompPAK(ref) New obj,i
 For i=0:1:255 Set:$d(@ref@(i)) obj(i+1)=$$%CompLEV(lev-1,$name(@ref@(i)))
 Set $p(obj(0),$c(0),257)=""
 For i=1:1:256 Set:$d(obj(i)) $e(obj(0),i)=$c(^%shm("Obj",obj(i)))
 Set obj=19 Quit $$Save^%ShmObj(.obj)
%COL New obj,typ,byt,top,pag
 Set $ZT="G %CompERROR",oid=$$%CompSUB(@ref@(4),.byt,.top,.pag) Quit:oid<1
 Set obj(1)=$s($d(pag):$C(13),1:$C(12))
 Set typ=+$g(^%shm("Obj",oid)),obj(3)=oid Goto:$d(byt) %XLTPack
 Set obj=9
 Set obj(0)=$C(1,3,typ)
 Set obj(1)=obj(1)_$C(+$g(@ref@(2)))
 Set obj(2)=$C(0)
 Set oid=$$Save^%ShmObj(.obj)
 Quit
%SUBToCol Set sbt=0 Goto %SUBCol
%SUBFromCol Set sbt=1 Goto %SUBCol
%SUBMulti Set sbt=2 Goto %SUBCol
%SUBCol New obj,oid,i,dst,out
 Set src=$name(@sref@("Src","SUB",name,1)),$ZT="G %CompERROR"
 Set i="",dst=$name(^%utility($j,"SUB")) Kill @dst
 For  Set i=$o(@src@(i)) Quit:i=""  Merge @dst@(i\256,i#256)=@src@(i)
 Set obj=19,$p(obj(0),$c(0),257)=""
 For  Set i=$o(@dst@(i)) Quit:i=""  Set oid=$$%CompPAGCol($name(@dst@(i)),sbt) Do:oid
 . Set obj(i+1)=oid,$e(obj(0),i+1)=$c(^%shm("Obj",oid))
 If $o(obj(1))=""  Set pag=1 Quit +$g(obj(1)) 
 Quit $$Save^%ShmObj(.obj)
%CompPAGCol(ref,sbt) New hi,obj,oid Set hi="",obj=19,$ZT="G %CompERROR"
 Set $p(obj(0),$c(0),257)=""
 For  Set hi=$o(@ref@(hi)) Quit:hi=""  Set oid=$$%CompMultiStruct($name(@ref@(hi)),sbt) Do:oid
 . Set obj(hi+1)=oid,$e(obj(0),hi+1)=$c(^%shm("Obj",oid))
 Quit $$Save^%ShmObj(.obj)
%CompMultiStruct(ref,sbt) New obj,nod,bas,from,to,val,i,ns,p,yes,no,opt Set $ZT="G %CompERROR"
 Set ns=$ql(ref),bas=$qs(ref,ns),obj(0)=$c(2),i=2
 Set nod=ref,yes=0,no=0,opt=1 Set:$d(@nod)#10=0 nod=$q(@nod)
 For  Quit:nod=""  Quit:$qs(nod,ns)'=bas  Set to=@nod Do  Set nod=$q(@nod)
 . If to[";" Set yes=yes+1
 . Else  Set no=no+1
 . If sbt=1,ns+1<$ql(nod) Set opt=0
 . Set dis=+$p(to,";",2),to=" "_$p(to,";",1)
 . If dis ZT:+$g(out(to),1)=0 "COMP"
 . Else  ZT:$d(out(to))&(sbt'=2) "COMP"
 . Set out(to)=dis
 If 'yes,'no ZT "COMP"
 If sbt=2,yes ZT "COMP"
 If sbt=0 Set:'yes sbt=2
 If sbt=1 Do
 . If no,'yes Set sbt=2
 . If 'no,yes Set:opt sbt=3
 If sbt'=3 Do
 . Set nod=ref Set:$d(@nod)#10=0 nod=$q(@nod)
 . For  Quit:nod=""  Quit:$qs(nod,ns)'=bas  Do  Set nod=$q(@nod)
 . . Set from=$e(nod,1,$l(nod)-1),from=$p(from,",",ns+1,999)
 . . If sbt=1,@nod'[";",from[",",$p(from,",",$l(from,","))'=0 Set from=from_",0"
 . . Set val(0)=$$%CompStr(from,.val),obj(i)=$$Save^%ShmObj(.val)
 . . Set obj(0)=obj(0)_$c(^%shm("Obj",obj(i))),i=i+1
 Set nod=ref Set:$d(@nod)#10=0 nod=$q(@nod)
 For  Quit:nod=""  Quit:$qs(nod,ns)'=bas  Do  Set nod=$q(@nod)
 . Set to=@nod,p=$f(to,";")
 . If p Set:sbt=0 $e(to,p-1)="," Set:sbt=1!(sbt=3) to=$p(to,";",1)
 . Else  If sbt=0,to[",",$p(to,",",$l(to,","))'=0 Set to=to_",0"
 . Set val(0)=$$%CompStr(to,.val),obj(i)=$$Save^%ShmObj(.val)
 . Set obj(0)=obj(0)_$c(^%shm("Obj",obj(i))),i=i+1
 Set obj=9,obj(1)=$C(sbt)
 Quit $$Save^%ShmObj(.obj)         
%CompPAK(ref) New myval,i Set $ZT="G %CompERROR"
 For i=0:1:255 Set:$d(@ref@(i))#2 myval(i)=@ref@(i)
 Quit $$%CompPAGMulti("myval")
%CompBITS(ref) New max,from,to,bits,obj,i,val Set $ZT="G %CompERROR"
 Set max=-1,from=$o(@ref@(""))
 For  Quit:from=""  Set to=^(from)+from-1 zt:to<from "COMP" Set:to>max max=to Set from=$o(^(from))
 zt:(max<0)!(max>65535) "COMP" Goto:max<256 %CBYT2BIT
 Set max=(max+2047)\2048,bits=$ZBITSTR(max*2048),from=""
 For  Set from=$o(^(from)) Quit:from=""  Set bits=$ZBITSET(bits,from+1,1,^(from))
 Set $p(max,$c(0),257)=""
 Set val=10 For i=0:1:max-1 Set val(0)=$e(bits,i*256+2,i*256+257) Do
 . Set:val(0)'=max obj(i+3)=$$Save^%ShmObj(.val)
 Set obj=9,obj(0)=$C(1,3)_$C(19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19)
 Set obj(1)=$C(8,1),obj(2)=$ZLC(0)
 Quit $$Save^%ShmObj(.obj)
%CBYT2BIT Set bits=$ZBITSTR(256),from=""
 For  Set from=$o(^(from)) Quit:from=""  Set bits=$ZBITSET(bits,from+1,1,^(from))
 Set obj=7,obj(0)=$C(1,3,1)
 Set obj(1)=$C(9,1),obj(2)=$ZLC(0),obj(3)=$e(bits,2,33)
 Quit $$Save^%ShmObj(.obj)
%CompVAL(ref,cvt) New hi,obj,oid Set hi="",obj=19,$ZT="G %CompERROR"
 Set $p(obj(0),$c(0),257)=""
 For  Set hi=$o(@ref@(hi)) Quit:hi=""  Set oid=$$%CompPAG($name(@ref@(hi))) Do:oid
 . Set obj(hi+1)=oid,$e(obj(0),hi+1)=$c(^%shm("Obj",oid))
 If $o(obj(1))="" Do
 . Set obj(0)=$C(1,3)_$E(obj(0)),obj(3)=obj(1)
 . Set obj(1)=$C(11,cvt)
 Else  Do
 . Set oid=$$Save^%ShmObj(.obj) Kill obj
 . Set obj(0)=$C(1,3,19),obj(3)=oid
 . Set obj(1)=$C(10,cvt)
 Set obj=9,obj(2)=$ZLC(0) Quit $$Save^%ShmObj(.obj)
%CompPAG(ref) New max,obj,i,lo,val Set max=-1,lo=$o(@ref@("")),$ZT="G %CompERROR"
 For  Quit:lo=""  Set val=^(lo),lo=$o(^(lo)) Set:val>max max=val
 zt:(max<0)!(max>$ZH("ffffffff")) "COMP" Goto %CompPAG1:max<256,%CompPAG2:max<65536
 Set val="" For i=0:1:255 Set val=val_$ZLC($g(^(i)))
 Set obj=12,obj(0)=val Quit $$Save^%ShmObj(.obj)
%CompPAG2 Set val="" For i=0:1:255 Set val=val_$ZWC($g(^(i)))
 Set obj=11,obj(0)=val Quit $$Save^%ShmObj(.obj)
%CompPAG1 Quit:'max 0 Set val="" For i=0:1:255 Set val=val_$C($g(^(i)))
 Set obj=10,obj(0)=val Quit $$Save^%ShmObj(.obj)
%CompPAGMulti(ref,flg) New min,max,minlen,maxlen,obj,tmp,i,lo,val,typ,trz
 Set flg=+$g(flg),$p(tmp(0),$c(0),257)="",trz=0
 Set minlen=65536,maxlen=-1,min=$ZH("100000000"),max=-1
 Set lo=$o(@ref@(""))
 For  Quit:lo=""  zt:lo'=+lo "COMP" Set lo=+lo Do  Set lo=$o(@ref@(lo))
 . Set val=@ref@(lo)
 . Set tmp(lo+1)=$$%CompStr(val,.typ,.min,.max,.minlen,.maxlen,.trz)
 . If 'lo,val=0,flg Set trz=0 ; Don't count 0->0 translation
 . Set $e(tmp(0),lo+1)=$C(typ)
 If max>255 Goto:minlen>0 %GenPAG2:maxlen=1,%GenPAKWRD4:maxlen=2
 Else  Goto:minlen>0 %GenPAG1:maxlen=1,%GenOFF:trz,%GenPAKBYT2:maxlen=2,%GenPAKBYT4:maxlen'>4
%GenOFF For i=1:1:256 Set obj=$A(tmp(0),i) Set:$d(tmp(i)) obj(0)=tmp(i),tmp(i)=$$Save^%ShmObj(.obj)
 Set tmp=19 Quit $$Save^%ShmObj(.tmp)
%GenPAG1 Set val="" For i=1:1:256 Set val=val_$E($g(tmp(i))_$c(0))
 Set obj=10 Set obj(0)=val Quit $$Save^%ShmObj(.obj)
%GenPAG2 Set val="" For i=1:1:256 Set val=val_$E($g(tmp(i))_$zwc(0),1,2)
 Set obj=11 Set obj(0)=val Quit $$Save^%ShmObj(.obj)
%GenPAKBYT2 Set val="" For i=1:1:256 Set val=val_$E($g(tmp(i))_$zwc(0),1,2)
 Set obj=14 Set obj(0)=val Quit $$Save^%ShmObj(.obj)
%GenPAKBYT4 Set val="" For i=1:1:256 Set val=val_$E($g(tmp(i))_$zlc(0),1,4)
 Set obj=15 Set obj(0)=val Quit $$Save^%ShmObj(.obj)
%GenPAKWRD4 Set val="" For i=1:1:256 Do
 . If $a(tmp(0),i)=5 Set tmp(i)=$zwc($a(tmp(i),1))_$zwc($a(tmp(i),2))
 . Set val=val_$E($g(tmp(i))_$zlc(0),1,4)
 Set obj=17 Set obj(0)=val Quit $$Save^%ShmObj(.obj)
%CompStr(val,typ,pmin,pmax,minlen,maxlen,trz) New i,len,chr,str,min,max
 Set len=$s($l(val):$l(val,","),1:0),str="",min=65536,max=-1
 Set pmin=+$g(pmin),pmax=+$g(pmax),minlen=+$g(minlen),maxlen=+$g(maxlen),trz=+$g(trz)
 Set:len<minlen minlen=len Set:len>maxlen maxlen=len Set typ=5 Quit:'len ""
 For i=1:1:len Set chr=$p(val,",",i) zt:chr'=+chr "COMP" Set:chr<min min=+chr Set:chr>max max=+chr
 If max>255 Set typ=6 For i=1:1:len Set str=str_$zwc($p(val,",",i))
 Else  Set typ=5 For i=1:1:len Set str=str_$c($p(val,",",i))
 Set:+$p(val,",",len)=0 trz=1
 Set:min<pmin pmin=min Set:max>pmax pmax=max Quit str

