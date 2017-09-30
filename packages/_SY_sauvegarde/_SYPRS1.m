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

;%SYPRS1^INT^1^59547,73892^0
SYPRS1 ;
 
 
 
 
 
 N TEMP,MN1,PREFX S MN1="MN",TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 N DIR,CTR,RETOUR,LISTE,OK
DEB 
 D CLEPAG^%VVIDEO
 D ^%VZCDB("TRANSFORMATION DE GRILLES SOUS FORME DE ROUTINES",0)
 S @MN1@(1)=$$^%QZCHW("QUELQUES GRILLES")_"^SEL"
 S @MN1@(2)=$$^%QZCHW("LES GRILLES D'1 PREFIXE")_"^PREF"
 S @MN1@(3)=$$^%QZCHW("TOUTES LES GRILLES")_"^TOUT"
DIAL2 
 S DX=10,DY=19 X XY D BLD^%VVIDEO W "Vous voulez transferer : " D NORM^%VVIDEO
 D ^%VQUIKMN(5,80,21,MN1,.AD,.CONTR)
 S DX=10,DY=19 D CLEBAS^%VVIDEO
 I ((CONTR="A")!(CONTR="F"))!(AD="FIN") G FIN
 I AD'="" G @AD
 G DIAL2
FIN K @(TEMP),@(MN1)
 Q
SEL 
 S DX=0,DY=21 D CLEBAS^%VVIDEO
 S DX=0,DY=5 X XY
 S DIR=$$PCONF^%INCASTO("PSYS")
 I DIR="" D ^%VZEAVT("Probleme d'installation : partition systeme introuvable") Q 0
 S LISTE=$$CONCAS^%QZCHAD("^[DIR]TEMPORAI",$J_","_$P($ZPOS,"^",2)_","_"GRILLES") K @(LISTE),^[DIR]TEMPORAI($J)
 D BOUCSEL(LISTE) S OK=$$MODIF(LISTE) G:OK=-1 DEB
 D POCLEPA^%VVIDEO,LIRE2^%VREAD($$^%QZCHW("Donnez le suffixe des routines du transfert")_" : ","",1,RM-4,DY+1,DY-1,"","$$CTR^%SYPRS1",.CTR,.PREFX)
 G:PREFX="" DEB
 D POCLEPA^%VVIDEO W "Les routines creees seront prefixees par %SC"_PREFX_" [RETURN]" R *R
 D POCLEPA^%VVIDEO S OK=$$MES^%VZEOUI("confirmation du tranfert ? ","N") G:'(OK) DEB
 D INT^%DIR S RETOUR=%DIR D POCLEPA^%VVIDEO,MSG^%VZEATT("transfert en cours ....")
 S PREFX="%SC"_PREFX
 D GLOB^%SYDV(LISTE,PREFX,RETOUR)
 K @(LISTE)
 G DEB
 
CTR(Y1,REAF) 
 S REAF=0
 Q:Y1="" 1
 I $L(Y1)>2 D ^%VZEAVT("Un prefixe ne peut contenir plus de 2 lettres !") Q 0
 Q 1
 
PREF 
 D ^%VZEAVT("Option non encore disponible !")
 G DEB
 
TOUT 
 D POCLEPA^%VVIDEO S OK=$$MES^%VZEOUI("confirmation ? ","N") G:OK'=1 DEB
 D INT^%DIR S RETOUR=%DIR D POCLEPA^%VVIDEO,MSG^%VZEATT("transfert en cours ....")
 D ALL^%SYDV(RETOUR)
 G DEB
 
BOUCSEL(GLO) 
BOUCS1 S DX=5,DY=DY+1 X XY D LIRE2^%VREAD($$^%QZCHW("grilles")_" : ","",1,RM-4,DY+1,DY-1,"","$$UCONT^%SYPRS1",.CTR,.GR)
 Q:GR=""
 I GR["*" D GROUPE(GLO,GR) G BOUCS1
 S @GLO@(GR)=""
 G BOUCS1
 
UCONT(Y1,REAF) 
 S REAF=0
 Q:Y1="" 1
 Q:Y1["*" 1
 I '($D(^%SCRE(Y1))) D ^%VZEAVT("Grille inconnue ...") Q 0
 Q 1
 
GROUPE(GLO,SCR) 
 S SCR=$P(SCR,"*",1),XSCR=$ZP(^%SCRE(SCR))
GROUP1 S XSCR=$O(^%SCRE(XSCR))
 Q:XSCR'[SCR
 S @GLO@(XSCR)=""
 G GROUP1
MODIF(GLO) 
 N LIG,I,SCR,GRILLE,OK S GRILLE=$$CONCAS^%QZCHAD(TEMP,"LIGNE") K @(GRILLE)
 D CLEPAG^%VVIDEO
 S SCR="" F I=1:1 S SCR=$O(@GLO@(SCR)) Q:SCR=""  S @GRILLE@(I)=SCR
 D REAFF S PLIG=1
 D POCLEPA^%VVIDEO S OK=$$MES^%VZEOUI("Modification de la liste de grilles ? ","N") Q:OK'=1 OK
 D ZLISTE^%QULIMO(0,2,79,20,GRILLE,.PLIG,"AJ^%SYPRS1","SU^%SYPRS1")
 K @(GLO) S LIG="" F I=1:1 S LIG=$O(@GRILLE@(LIG)) Q:LIG=""  S SCR=@GRILLE@(LIG),@GLO@(SCR)=""
 K @(GRILLE)
 Q 1
AJ 
 I '($D(^%SCRE(Y1))) D ^%VZEAVT("Grille inconnue ...") S OK=0 Q
 S OK=1
 Q
SU 
 S OK=1
 Q
REAFF 
 D CLEPAG^%VVIDEO,^%VZCDB("LISTE DE GRILLES A TRANSFORMER",0)
 S DXG=0,DYH=2,LV=20,LH=80 D CARS^%VVIDEO
 D REAFF^%QULIMO3(1,1,GRILLE,0,2,79,20)
 Q
RESTOR 
 N RETOUR,CTR,PREFX,OK,MN1 S MN1="MN" K @(MN1)
RESTOR1 
 D CLEPAG^%VVIDEO,^%VZCDB("REGENERATION DES GRILLES",0)
 S @MN1@(1)=$$^%QZCHW("QUELQUES GRILLES")_"^RESQQ"
 S @MN1@(2)=$$^%QZCHW("TOUTES LES GRILLES")_"^RESTOUT"
DIAL3 
 S DX=10,DY=19 X XY D BLD^%VVIDEO W "Vous voulez transferer : " D NORM^%VVIDEO
 D ^%VQUIKMN(5,80,21,MN1,.AD,.CONTR)
 S DX=10,DY=19 D CLEBAS^%VVIDEO
 I ((CONTR="A")!(CONTR="F"))!(AD="FIN") G FRES
 I AD'="" G @AD
 G DIAL3
RESTOUT 
 D POCLEPA^%VVIDEO S OK=$$MES^%VZEOUI("confirmation ?","N") G:'(OK) RESTOR1
 D INT^%DIR S RETOUR=%DIR D POCLEPA^%VVIDEO,MSG^%VZEATT("transfert en cours ....")
 D RESALL^%SYDV(RETOUR)
 G RESTOR1
RESQQ S DX=5,DY=8 X XY D LIRE2^%VREAD($$^%QZCHW("Donnez le suffixe des routines sources ")_" : ","",1,RM-4,DY+1,DY-1,"","$$CTR^%SYPRS1",.CTR,.PREFX)
 G:PREFX="" RESTOR1
 D BLK^%VVIDEO S DX=5,DY=17 X XY W "Les routines sources sont prefixees par %SC"_PREFX D NORM^%VVIDEO X XY
 D POCLEPA^%VVIDEO S OK=$$MES^%VZEOUI("confirmation ?","N") G:'(OK) RESTOR1
 D INT^%DIR S RETOUR=%DIR D POCLEPA^%VVIDEO,MSG^%VZEATT("transfert en cours ....")
 S PREFX="%SC"_PREFX
 D RESTOR^%SYDV(PREFX,RETOUR)
 G RESTOR1
FRES 
 K @(MN1) Q
SUP 
 N RETOUR,CTR,PREFX,OK
SUP1 
 D CLEPAG^%VVIDEO,^%VZCDB("SUPPRESSION DE PREFIXES",0)
 S DX=5,DY=8 X XY D LIRE2^%VREAD($$^%QZCHW("Donnez le suffixe des routines sources ")_" : ","",1,RM-4,DY+1,DY-1,"","$$CTR^%SYPRS1",.CTR,.PREFX)
 Q:PREFX=""
 D INT^%DIR S RETOUR=%DIR
 D BLK^%VVIDEO S DX=5,DY=17 X XY W "Les routines a supprimer sont prefixees par %SC"_PREFX D NORM^%VVIDEO X XY
 D POCLEPA^%VVIDEO S OK=$$MES^%VZEOUI("confirmation ? ","N") G:'(OK) SUP1
 S PREFX="%SC"_PREFX
 D KILL^%SYDV(PREFX,RETOUR)
 G SUP1

