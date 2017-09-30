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

;%SDOPASS^INT^1^59547,73889^0
SDOPASS ;
 
 
 
 
 
 
 
UN(O,V) 
 N ERR
 S ERR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ERREUR") K @(ERR)
 S $ZT="ERREUR^%SDOPASS"
 D EXT(O,V)
 G FIN
 
 
ALL 
 N O,V,ERR
 S ERR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ERREUR") K @(ERR)
 S O=""
LOOP1 S O=$O(^[QUI]GRAPHE2(O)) G:O="" FIN
 S V=""
LOOP2 S V=$O(^[QUI]GRAPHE2(O,V)) G:V="" LOOP1
 S $ZT="ERREUR^%SDOPASS"
 D EXT(O,V)
 G LOOP2
 
ERREUR 
 S $ZT=""
 S @ERR@(O_" "_V_" "_$ZE)=""
 I $ZE["INTERRUPT" G FIN
 G LOOP2
 
FIN 
 
 I '($D(@ERR)) G FIN2
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("liste d'erreurs"),0)
 D INIT^%QUCHOIP(ERR,1,"",1,2,70,18),AFF^%QUCHOIP
 S A=$$UN^%QUCHOIP
 
FIN2 
 K @(ERR)
 Q
 
EXT(O,V) 
 
 
 
 D CLEPAG^%VVIDEO,^%VZCDB("passerelle graphique V 2.2 vers V 2.3",0)
 D ^%VZCDB($$^%QZCHW("objet")_" : "_O_"   "_$$^%QZCHW("version")_" : "_V,1)
 N I,N,GLOBJ,GLTEXT,GLCOMP,POINT,TEMP,REFPT,TEMPREF
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"WORK") K @(TEMP)
 S POINT=$$CONCAS^%QZCHAD(TEMP,"POINT")
 S GLOBJ=$$DEF^%SDOCMS(O,V)
 S GLTEXT=$$TEXT^%SDOCMS(O,V)
 S GLCOMP=$$COMP^%SDOCMS(O,V)
 S TEMPREF=$$CONCAS^%QZCHAD(TEMP,"REF")
 S GLOTYP=$$CONCAS^%QZCHAD(TEMP,"TYPELEM")
 S TEMPO=$$CONCAS^%QZCHAD(TEMP,"TEMPO")
 S REFPT="^[QUI]GRAPHE2(O,V,0,""NOMS"")"
 I $D(@GLOBJ) S @ERR@(O_" "_V_" "_"deja existant")="" Q
 D ISESS^%SDEANTI(O,V,.GLOTYP,.TEMPREF,.GLOBJ,.GLCOMP,.GLTEXT,.TEMPO)
 
 S NPT=0,EL=0
 S N="" F I=0:0 S N=$O(@REFPT@(N)) Q:N=""  D POINT(N)
 S N=0 F I=0:0 S N=$O(^[QUI]GRAPHE2(O,V,N)) Q:N=""  D TRANS(O,V,N)
 D ESESS^%SDEANTI(GLOTYP,TEMPREF)
 K @(TEMP)
 Q
 
POINT(N) 
 S NPT=NPT+1
 S @POINT@(N)="P"_NPT
 Q
TRANS(O,V,N) 
 N TYP,ELEM,TYPE,PD,PA,PC,PR,GR,ID,IF,X1,X2,X3,XC,Y1,Y2,Y3,YC
 S ELEM=^[QUI]GRAPHE2(O,V,N)
 S TYP=$P(ELEM,"^",1)
 Q:TYP=8
 G @TYP
 
 
1 
 
 S EL=$$POP(EL),TYPE="DEMIE.ELLIPSE"
 S SYNT=$P(ELEM,"^",14),ID=$P(ELEM,"^",6),TL=$$TL($P(ELEM,"^",7))
 S SYNT=$E(SYNT,2,$L(SYNT)-1)
 
 I SYNT'="" G 11
10 
 S XC=$P(ELEM,"^",2),YC=$P(ELEM,"^",3),PR=$P(ELEM,"^",4),GR=$P(ELEM,"^",5)
 
 S X1=(PR*$$COS^%PBCACV(ID))+XC,Y1=(PR*$$SIN^%PBCACV(ID))+YC
 
 S X2=(PR*$$COS^%PBCACV(ID+180))+XC,Y2=(PR*$$SIN^%PBCACV(ID+180))+YC
 
 S X3=(GR*$$COS^%PBCACV(ID+90))+XC,Y3=(GR*$$SIN^%PBCACV(ID+90))+YC
 S @GLTEXT@(EL)=EL_" ; DEMIE.ELLIPSE ; 1 ; "_TL_" ; 1 ; ( "_$$T(X1)_" ; "_$$T(Y1)_" ) ; ( "_$$T(X2)_" ; "_$$T(Y2)_" ) ; ( "_$$T(X3)_" ; "_$$T(Y3)_" )"
 G 19
11 
 S LG=$P(SYNT,"/") I LG=2 G 12
 
 
 G 10
 S PD=$P(SYNT,";"),PA=$P(SYNT,";",2),R=$P(SYNT,";",3)
 
 S X1=$P(@REFPT@(PD),"^"),Y1=$P(@REFPT@(PD),"^",2)
 S X2=$P(@REFPT@(PA),"^"),Y2=$P(@REFPT@(PA),"^",2)
 
 S XC=(X1+X2)/2,YC=(Y1+Y2)/2
 S X3=(R*$$COS^%PBCACV(ID))+XC,Y3=(R*$$SIN^%PBCACV(ID))+YC
 S @GLTEXT@(EL)=EL_" ; DEMIE.ELLIPSE ; 1 ; "_TL_" ; 2 ; ( "_$$T(XC)_" ; "_$$T(YC)_" ) ; "_$$T(PR)_" ; "_$$T(GR)_" ; "_ID_" ; "_PD_" ; "_PA
 G 19
 
12 
 S PC=$P(SYNT,"/"),PR=$P(SYNT,"/",2),GR=$P(SYNT,";",3)
 S @GLTEXT@(EL)=EL_" ; DEMIE.ELLIPSE ; 1 ; "_TL_" ; 2 ; "_PC_" ; "_$$T(PR)_" ; "_$$T(GR)_" ; "_ID
 S X1=$P(@REFPT@(PD),"^"),Y1=$P(@REFPT@(PD),"^",2)
 S X2=$P(@REFPT@(PA),"^"),Y2=$P(@REFPT@(PA),"^",2)
 
 S XC=(X1+X2)/2,YC=(Y1+Y2)/2,GR=$P(ELEM,"^",5)
 S X3=(GR*$$COS^%PBCACV(ID+90))+XC,Y3=(GR*$$SIN^%PBCACV(ID+90))+YC
 S ID=$P(SYNT,"/",4)
19 
 S @GLOBJ@("EL",EL,"TYPE")="DEMIE.ELLIPSE"
 S @GLOBJ@("EL",EL,"PRES")="1^"_X1_"^"_Y1_"^"_X2_"^"_Y2_"^"_X3_"^"_Y3_"^"_TL
 D ANA^%SDOPAS3(EL,TYPE)
 Q
 
2 
 
 S EL=$$POP(EL),TYPE="ELLIPSE"
 G 3^%SDOPAS2
 
 
3 
 S EL=$$POP(EL),TYPE="POINT"
 G 3^%SDOPAS2
 
4 
 S EL=$$POP(EL),TYPE="TEXTE"
 G 4^%SDOPAS2
 
5 
 S EL=$$POP(EL),TYPE="DROITE"
 G 5^%SDOPAS2
 
6 
 S EL=$$POP(EL),TYPE="ARC"
 G 6^%SDOPAS3
 
7 
 S EL=$$POP(EL),TYPE="CERCLE"
 G 7^%SDOPAS3
 
POP(EL) 
 S EL=EL+1
 Q EL
 
T(XX) 
 Q $J(XX/188E-1,1,1)
 
TL(TL) 
 Q """"_$S(TL="M":"MIXTE",TL="C":"COURT",TL="L":"LONG",TL="I":"INVISIBLE",1:"NORMAL")_""""
 Q

