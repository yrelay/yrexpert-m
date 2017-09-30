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

;%QSXCB^INT^1^59547,73883^0
%QSXCB ;
QSXCB(OKB,OKA,INTEG,VISU) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N TEMP,BASES,BASE,I,RESUL,LL,ER,RESLIEN,CARD1,CARD2,ERC,ERV,CALC,LIB
 N ERROR
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S BASES=$$CONCAS^%QZCHAD(TEMP,"BASES")
 
 S RESUL=$$CONCAS^%QZCHAD(INTEG,"RESUL,ATT")
 
 S RESLIEN=$$CONCAS^%QZCHAD(INTEG,"RESUL,LIEN")
 
 S LL=$$CONCAS^%QZCHAD(TEMP,"LL")
 
 S ER=$$CONCAS^%QZCHAD(INTEG,"ER")
 
 S ERV=$$CONCAS^%QZCHAD(ER,"VIS")
 
 S ERC=$$CONCAS^%QZCHAD(ER,"CARD")
 
 S CALC=$$CONCAS^%QZCHAD(INTEG,"CALC")
 S TEMPS=$$CONCAS^%QZCHAD(INTEG,"TEMPS")
 S ERROR=$$CONCAS^%QZCHAD(INTEG,"ERROR")
 
 S @CALC="en cours"
 K @(TEMP),@(ER)
 D DEB^%VTEMPS($P($ZPOS,"^",2))
 D REPI^%QSGEST9(BASES)
 
 I OKB D B0
 I OKA D A
 S @TEMPS=$$FIN^%VTEMPS($P($ZPOS,"^",2))_"  "_$$TEMPS^%QMDATE
 S LIB=$$^%QCAZG("LIB")
 K @(CALC)
 S:LIB'="" @ERROR@(LIB)=""
 Q
 
B0 S $ZT="ERR^%QSXCB"
 S BASE=""
 F I=0:0 S BASE=$O(@BASES@(BASE)) Q:BASE=""  D B1
 S BASE=""
 F I=0:0 S BASE=$O(@LL@(BASE)) Q:BASE=""  D V1
 S $ZT=""
 Q
B1 N LIENS,LIEN,J
 S LIENS=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LIENS") K @(LIENS)
 D LIEN^%QSGEST9(BASE,LIENS)
 S LIEN=""
 F J=0:0 S LIEN=$O(@LIENS@(LIEN)) Q:LIEN=""  D B2
 K @(LIENS)
 Q
B2 D ATT^%QSX(RESLIEN,BASE,LIEN)
 I VISU W !,BASE,"  ",LIEN
 I '($$EG4(RESLIEN,BASE,LIEN)) S @ERC@(BASE,"LIEN",LIEN)="" I VISU W " erreur !!!"
 S BASED=$$REPD^%QSGEL2(BASE,LIEN) Q:BASED=""
 S TYPEL=@LIENS@(LIEN)
 
 S:(TYPEL=2)!(TYPEL=4) @LL@(BASE,LIEN,BASED)=TYPEL Q
 
 I (TYPEL=3)&('($D(VU(BASED,BASE)))) S VU(BASE,BASED)="",VU(BASED,BASE)="",@LL@(BASE,LIEN,BASED)=TYPEL Q
 Q
 
A S $ZT="ERR^%QSXCB"
 S BASE=""
 F I=0:0 S BASE=$O(@BASES@(BASE)) Q:BASE=""  D A1
 S $ZT=""
 Q
A1 N ATTRS,ATT,J
 D RA^%QSGE1(BASE,"ATTRS")
 S ATT=""
 F J=0:0 S ATT=$O(ATTRS(ATT)) Q:ATT=""  D A2
 Q
A2 D ATT^%QSX(RESUL,BASE,ATT)
 I VISU W !,BASE,"  ",ATT
 I '($$EG4(RESUL,BASE,ATT)) S @ERC@(BASE,"ATT",ATT)="" I VISU W " erreur !!!"
 Q
 
 
 
EG4(RESUL,BASE,ATT) 
 N CARD,EGAL
 S CARD=@RESUL@(BASE,ATT,"CARD","QUERYV"),EGAL=1
 F I=2,3,4 Q:EGAL=0  S:CARD'=@RESUL@(BASE,ATT,"CARD","QUERY"_I) EGAL=0
 Q EGAL
 
VIS(RESUL,BASE1,LIEN1,BASE2,TYPEL,CARD1,CARD2) 
 N LIEN2
 S LIEN2=$$LIENI^%QSGEL2(BASE1,BASE2,LIEN1,TYPEL)
 S CARD1=@RESUL@(BASE1,LIEN1,"CARD","QUERYV")
 S CARD2=@RESUL@(BASE2,LIEN2,"CARD","QUERYV")
 Q CARD1=CARD2
 
 
 
V1 N J,LIEN,BASED,TYPEL
 S LIEN=""
 F J=0:0 S LIEN=$O(@LL@(BASE,LIEN)) Q:LIEN=""  D V2
 Q
V2 S BASED=""
V22 S BASED=$O(@LL@(BASE,LIEN,BASED)) Q:BASED=""
 I VISU W !,BASE,"  ",LIEN
 S TYPEL=@LL@(BASE,LIEN,BASED)
 I '($$VIS(RESLIEN,BASE,LIEN,BASED,TYPEL,.CARD1,.CARD2)) S @ERV@(BASE,"LIEN",LIEN)=BASE_" = "_CARD1_" / "_BASED_" = "_CARD2 I VISU W " erreur !!!"
 G V22
 
 
 
 
ERC(STO,MODE,BASE,ATT) 
 N STO1
 S STO1=$$CONCAS^%QZCHAD(STO,"ER,CARD")
 Q $D(@STO1@(BASE,MODE,ATT))'=0
 
ERV(STO,BASE,ATT,MSG) 
 N STO1
 S STO1=$$CONCAS^%QZCHAD(STO,"ER,VIS")
 S MSG=$$^%QCAZG($$CONCAS^%QZCHAD(STO1,BASE_",LIEN,"_ATT))
 Q $D(@STO1@(BASE,"LIEN",ATT))'=0
 
TEST S STO="^"_"QSXCB" K @(STO)
 D ^%QSXCB(1,0,STO,1)
 Q
JTEST X ^BTL
 N STO,A
 S STO="^"_"QSXCB(WHOIS)"
 D ^%QSXCB(1,0,STO,0)
 Q
 
ERR S LIB=$ZE Q
 
INT(OKA,OKB) 
 N STO,A,TEMP,PAR
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S PAR=$$CONCAS^%QZCHAD(TEMP,"PAR")
 D CLEPAG^%VVIDEO,ON^%VZEATT
 S STO="^"_"QSXCB(WHOIS)"
 K @(STO)
 S @PAR@(1)=OKB
 S @PAR@(2)=OKA
 S @PAR@(3)=STO
 S @PAR@(4)=0
 S ERR=$$^%QCSJOB("^%QSXCB",PAR,WHOIS)
 K @(TEMP)
 D OFF^%VZEATT
 I ERR="" D ^%VZEAVT($$^%QZCHW("Le job de verification a ete lance ...")) Q
 D ^%VZEAVT($$^%QZCHW("Le job de verification n'a pu etre lance")) Q
 Q

