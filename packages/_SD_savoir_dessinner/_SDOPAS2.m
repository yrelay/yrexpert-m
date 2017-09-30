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

;%SDOPAS2^INT^1^59547,73889^0
SDOPAS2 ;
 
 
 
 
 
 
 
2 
 
 S SYNT=$P(ELEM,"^",14),ID=$P(ELEM,"^",6),TL=$$TL($P(ELEM,"^",7))
 S SYNT=$E(SYNT,2,$L(SYNT)-1)
 
 I SYNT'="" G 21
20 
 S XC=$P(ELEM,"^",2),YC=$P(ELEM,"^",3),PR=$P(ELEM,"^",4),GR=$P(ELEM,"^",5)
 
 S X1=(PR*$$COS^%PBCACV(ID))+XC,Y1=(PR*$$SIN^%PBCACV(ID))+YC
 
 S X2=(PR*$$COS^%PBCACV(ID+180))+XC,Y2=(PR*$$SIN^%PBCACV(ID+180))+YC
 
 S X3=(GR*$$COS^%PBCACV(ID+90))+XC,Y3=(GR*$$SIN^%PBCACV(ID+90))+YC
 S @GLTEXT@(EL)=EL_" ; ELLIPSE ; 1 ; "_TL_" ; 1 ; ( "_$$T(X1)_" ; "_$$T(Y1)_" ) ; ( "_$$T(X2)_" ; "_$$T(Y2)_" ) ; ( "_$$T(X3)_" ; "_$$T(Y3)_" )"
 G 29
 
 
21 
 S LG=$P(SYNT,"/") I LG>2 G 22
 
 G 20
 S PD=$P(SYNT,";"),PA=$P(SYNT,";",2),R=$P(SYNT,";",3)
 
 S X1=$P(@REFPT@(PD),"^"),Y1=$P(@REFPT@(PD),"^",2)
 S X2=$P(@REFPT@(PA),"^"),Y2=$P(@REFPT@(PA),"^",2)
 
 S XC=(X1+X2)/2,YC=(Y1+Y2)/2,GR=$P(ELEM,"^",5)
 S X3=(GR*$$COS^%PBCACV(ID+90))+XC,Y3=(GR*$$SIN^%PBCACV(ID+90))+YC
 S @GLTEXT@(EL)=EL_" ; ELLIPSE ; 1 ; "_TL_" ; 2 ; ( "_$$T(XC)_" ; "_$$T(YC)_" ) ; "_$$T(PR)_" ; "_$$T(GR)_" ; "_ID_" ; "_PD_" ; "_PA
 G 29
 
22 
 S PC=$P(SYNT,"/",1),PR=$P(SYNT,"/",2),GR=$P(SYNT,"/",3),ID=$P(SYNT,"/",4)
 S @GLTEXT@(EL)=EL_" ; ELLIPSE ; 1 ; "_TL_" ; 2 ; "_PC_" ; "_$$T(PR)_" ; "_$$T(GR)_" ; "_ID
 S X1=$P(@REFPT@(PD),"^"),Y1=$P(@REFPT@(PD),"^",2)
 S X2=$P(@REFPT@(PA),"^"),Y2=$P(@REFPT@(PA),"^",2)
 
 S XC=(X1+X2)/2,YC=(Y1+Y2)/2,GR=$P(ELEM,"^",5)
 S X3=(GR*$$COS^%PBCACV(ID+90))+XC,Y3=(GR*$$SIN^%PBCACV(ID+90))+YC
29 S @GLOBJ@("EL",EL,"TYPE")="ELLIPSE"
 S @GLOBJ@("EL",EL,"PRES")="2^"_X1_"^"_Y1_"^"_X2_"^"_Y2_"^"_X3_"^"_Y3_"^"_TL
 D ANA^%SDOPAS3(EL,TYPE)
 Q
 
3 
 
 S X1=$P(ELEM,"^",2),Y1=$P(ELEM,"^",3),TEXTE=$P(ELEM,"^",6)
 S TEXTE=@POINT@(TEXTE)
 S @GLOBJ@("EL",EL,"PRES")="3^"_X1_"^"_Y1_"^"_TEXTE
 S NOPT=$P(TEXTE,"P",2)
 S @GLOBJ@("PT",NOPT)=""
 S @GLOBJ@("PT",NOPT,"NOEL")=EL
 S @GLOBJ@("PT",NOPT,"X")=""
 S @GLOBJ@("PT",NOPT,"Y")=""
 S @GLOBJ@("PTR",NOPT,"X")=$$T(X1)
 S @GLOBJ@("PTR",NOPT,"Y")=$$T(Y1)
 S @GLTEXT@(EL)=EL_" ; POINT ; "_TEXTE_" ; 1 ; ""VISIBLE"" ; ( "_$$T(X1)_" ; "_$$T(Y1)_" )"
 S @GLOBJ@("EL",EL,"TYPE")="POINT"
 S @GLOBJ@("PAE",NOPT,EL)=""
 S @GLOBJ@("PAEI",EL,NOPT)=""
 D ANA^%SDOPAS3(EL,TYPE)
 S @GLOBJ@("PTR",NOPT,"X")=$$T(X1)
 S @GLOBJ@("PTR",NOPT,"Y")=$$T(Y1)
 Q
 
4 
 
 S X1=$P(ELEM,"^",2),Y1=$P(ELEM,"^",3),TEXTE=$P(ELEM,"^",4)
 I '($$EXIST^%LXSTOCK(TEXTE)) S TEXTE=""""_TEXTE_""""
 S @GLOBJ@("EL",EL,"PRES")="4^"_X1_"^"_Y1_"^1^0^"_TEXTE
 S @GLTEXT@(EL)=EL_" ; TEXTE ; 1 ; ( "_$$T(X1)_" ; "_$$T(Y1)_" ) ; "_TEXTE
 S @GLOBJ@("EL",EL,"TYPE")="TEXTE"
 D ANA^%SDOPAS3(EL,TYPE)
 Q
 
5 
 
 S @GLOBJ@("EL",EL,"PRES")=$P(ELEM,"^",1,6),TL=$$TL($P(ELEM,"^",6))
 S SYNT=$P(ELEM,"^",9),SYNT=$E(SYNT,2,$L(SYNT)-1)
 
 I $L(SYNT,";")>1 G 50
 S X1=$P(ELEM,"^",2),Y1=$P(ELEM,"^",3)
 S X2=$P(ELEM,"^",4),Y2=$P(ELEM,"^",5)
 S @GLTEXT@(EL)=EL_" ; DROITE ; 1 ; "_TL_" ; 1 ; ( "_$$T(X1)_" ; "_$$T(Y1)_" ) ; ( "_$$T(X2)_" ; "_$$T(Y2)_" )"
 G 59
50 
 S LG=$L(SYNT,";")
 I LG=3 G 51
 
 S PD=@POINT@($P(SYNT,";",1)),PA=@POINT@($P(SYNT,";",2))
 S @GLTEXT@(EL)=EL_" ; DROITE ; 1 ; "_TL_" ; 1 ; "_PD_" ; "_PA
 G 59
51 
 S PD=@POINT@($P(SYNT,";",2)),PA=@POINT@($P(SYNT,";",3))
 S SYNT=$P(SYNT,";",1),R=$P(SYNT,"/"),ID=$P(SYNT,"/",2)
 S @GLTEXT@(EL)=EL_" ; DROITE ; 1 ; "_TL_" ; 2 ; "_PD_" ; "_$$T(R)_" ; "_ID_" ; "_PA
59 S @GLOBJ@("EL",EL,"TYPE")="DROITE"
 D ANA^%SDOPAS3(EL,TYPE)
 Q
 
T(XX) 
 Q $J(XX/188E-1,1,1)
 
TL(TL) 
 Q """"_$S(TL="M":"MIXTE",TL="C":"COURT",TL="L":"LONG",TL="I":"INVISIBLE",1:"NORMAL")_""""
 Q

