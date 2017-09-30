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
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%ShmObj^INT^1^58140,5742^0
%ShmObj ; Utilities for Shared Objects ; CFL204 12/13/99  ; Compiled March 6, 2000 19:35:41
 ;%ShmObj.INC ; CFL204 12/11/98 
 Quit
Save(obj) New oid,hash
 Set oid=""
 Lock ^%shm("Obj")
 Set hash=$$CalcHash(.obj)
 For  Set oid=$o(^%shm("Hsh",1,hash,oid)) Quit:oid=""  Quit:$$IsEqual(.obj,oid)
 If 'oid Set oid=$ZINCR(^%shm("Obj")),^%shm("Hsh",0,oid)=hash,^%shm("Hsh",1,hash,oid)="" m ^%shm("Obj",oid)=obj
 Lock
 Quit +oid
IsEqual(obj,oid) Quit:obj'=^%shm("Obj",oid) 0 Quit:obj(0)'=^(oid,0) 0
 Quit:(+$E("111111000111111111",obj)) 1 New s1,s2 Set s1="",s2=""
 For  Set s1=$o(obj(s1)),s2=$o(^(s2)) Quit:s1=""  Quit:s2=""  Quit:obj(s1)'=^(s2)
 Quit (s1="")&(s2="")
CalcHash(obj) Quit:(+$E("111111000111111111",obj)) $ZCRC(obj(0),7)
 New str,len,i,typ Set str=obj(0),len=$l(str)
 For i=1:1:len Set typ=$a(str,i),str=str_$s((+$E("1111",typ)):+$g(obj(i)),1:$ZLC($g(^%shm("Hsh",0,+$g(obj(i))))))
 Quit $ZCRC(str,7)
Load(oid) Quit:'oid 0 Quit:$d(^%shm("Off",0,oid)) ^(oid)
 New typ,off Set typ=^%shm("Obj",oid),off=^(oid,0) Goto:(+$E("000000111",typ)) %LoadSTRUCT
 Goto:typ=19 %LoadPAGOFF Set:$ZU(40,0,0) off=$ZU(126,1,(+$E("012301000012312323",typ)),$$Pad(off,(+$E("012301000012312323",typ))))
%LoadIt Set off=$ZU(126,0,typ,off) zt:'off "LOAD"
 Set ^%shm("Off",0,oid)=off,^%shm("Off",1,off,oid)="" Quit off
%LoadSTRUCT New i,val,arr,sub Set i=1,val="",arr=off
%LoadLoop Set off=$g(^%shm("Obj",oid,i)),sub=$a(arr,i)
 If (+$E("1111",sub)) Set:$ZU(40,0,0) off=$ZU(126,1,$A($C(0,1,2,3),sub),$$Pad(off,$A($C(0,1,2,3),sub)))
 Else  Set off=$E($ZQC($$Load(off)),1,$ZU(40,0,25)) Set:$ZU(40,0,0) off=$RE(off)
 Set val=val_$E($ZQC(0),1,(6-$L(val))#$S(sub>4:$ZU(40,0,25),1:$A($C(1,2,4,8),sub)))_off,i=i+1 Goto:i'>$l(arr) %LoadLoop
 Set:$L(val)#2 val=val_$c(0) Set off=val Goto %LoadIt
%LoadPAGOFF New i Set off="" For i=1:1:256 Set off=off_$E($ZQC($$Load($g(^%shm("Obj",oid,i)))),1,$ZU(40,0,25))
 Set:$ZU(40,0,0) off=$ZU(126,1,$S($ZU(40,0,25)=4:2,1:3),$$Pad(off,$S($ZU(40,0,25)=4:2,1:3))) Goto %LoadIt
Init Kill ^%shm Quit
Start Kill ^%shm("Off") Quit
Pad(val,typ)    Quit:'typ val  New l Set l=$E("1248",typ+1)-$L(val)
 Quit:l'>0 val  Quit val_$E($C(0,0,0,0,0,0,0,0),1,l)

