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
;! Nomprog     : ;%VACT                                                       !
;! Module      : VIDEO                                                        !
;! But         : Activation de la vidéo                                       !
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
;! HL002 ! HL     ! 10/06/12 ! Déplacement de /usr/local/ vers /opt/          !
;! HL003 ! HL     ! 02/06/12 ! Il est préférable d'initailiser PK au démarrage!
;! HL004 ! HL     ! 14/08/12 ! Regroupement des variables GTM dans GTMINI.m   !
;! HL005 ! HL     ! 25/08/12 ! Regroupement des variables GTM dans GTM.m      !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

%VACT ;
 L
 D INT^%DIR,CURRENT^%IS,VARSYS^%QCSAP
 D INITSESS^%SYSUTI1
 D STANDONE^%VTOZE("ATTENTE")
 D ^%SGGLOB
 D NETJOB^%SGNETMZ($J),CLEAR^%SYSUTI1
 D INIT^%SGVAR,INITREM^%QZCHW,REMCTR^%SYSCLAV
 D MOZ^%VACTVER
 D ^%VACTINI
 K ^TABIDENT($I) S ^TABIDENT($I,"%UCI")=%DIR,^TABIDENT($I)=""
 O 0 U 0 S A=1 K ^PIMEN($I)
 D:DTM ^%INCCLAV
 D:IBMPC&(DTM=0) VT220^%VT

START 
READ S DX=21,DY=12 X XY D REV^%VVIDEO,BLK^%VVIDEO W $$^%QZCHW("Votre partition") S DX=25,DY=13 X XY D NORM^%VVIDEO D ^%VLEC
 ;HL2 G FIN:$A(Y1)<32,FIN:'($D(^TABIDENT(Y1))) K ATT S (X,WHOIS)=Y1 D TABID^%VACTZIN
 G FIN:$A(Y1)<32,FIN2:'($D(^TABIDENT(Y1))) K ATT S (X,WHOIS)=Y1 D TABID^%VACTZIN
 D NORM^%VVIDEO,REV^%VVIDEO S DX=21,DY=12 X XY W $$^%QZCHW("Votre partition")
 S QUI=^TABIDENT(WHOIS,"MACHINE"),MSG=^TABIDENT(WHOIS,"NOM"),DX=0,DY=0 X XY
 
 S (WHOIS("ETUDE"),^NUMETUD($J))=0
 D ^%VACTLIM
 
 D REINIT^%EDPRLG
 I $D(^GDERWH($I)),^GDERWH($I)=WHOIS G SUITE
 D:$D(^GDERWH($I)) SAVMNL
 D TUER,RESMNL
SUITE S ^GDERWH($I)=WHOIS

 ;HL004 ; le répertoire n'existe pas
 ;HL004 I $ZSEARCH("/opt/"_$$MIN^%VMINUSC(QUI)_"/g/")_$ZSEARCH("/opt/"_$$MIN^%VMINUSC(QUI)_"/g/")="" D NORM^%VVIDEO W !!,"/opt/"_$$MIN^%VMINUSC(QUI)_"/g/"_QUI_".gld"," : inconnu...",!,"CONSEIL : Modifier le répertoire de votre partition,",!,"          le repertoire doit etre de la forme : "_"/opt/"_$$MIN^%VMINUSC(QUI)_"/g/",!! R "[RETURN]",*TMP:180 G FIN
 ;HL004  le répertoire existe mais le fichier n'existe pas
 ;HL004 I $ZSEARCH("/opt/"_$$MIN^%VMINUSC(QUI)_"/g/"_QUI_".gld")_$ZSEARCH("/opt/"_$$MIN^%VMINUSC(QUI)_"/g/"_QUI_".gld")="" D NORM^%VVIDEO W !!,"/opt/"_$$MIN^%VMINUSC(QUI)_"/g/"_QUI_".gld"," : inconnu...",!,"CONSEIL : Creer d'abord vos fichiers de partition,",!,"          les fichiers et répertoire doivent etre de la forme : "_"/opt/"_$$MIN^%VMINUSC(QUI)_"/g/"_QUI_".gld",!! R "[RETURN]",*TMP:180 G FIN
 ;HL004 S $ZDIRECTORY="/opt/"_$$MIN^%VMINUSC(QUI)_"/g/"
 ;HL005 G:'($$ZDIRECTORY^GTMINI()) FIN
 G:'$$ZDIRECTORY^%GTM(QUI) FIN

 D INIT^%SYSSEMA(QUI)
 D NORM^%VVIDEO,BLD^%VVIDEO
 S DXG=$S('(TADTM):40,1:15)-($L(MSG)\2),DYH=21 D BIG^%VVIDEO X XY D INIT ;; W *-1
 
 D QUI^%VACTVER

 S AL=1 G:^TABIDENT(X,"SITE")=$I MESS D FIX^%INCUPA(^TABIDENT(WHOIS,"PASS"),41,12,.AL)
MESS D CLEPAG^%VVIDEO,CURON^%VVIDEO,NORM^%VVIDEO G FIN:'(AL)
 S (^PIMEN($I),PIM)=0 I $D(^TABIDENT(WHOIS,"BACK")) S PIM=PIM+1,^PIMEN($I)=PIM,^PIMEN($I,PIM)=^TABIDENT(WHOIS,"BACK")
 I $D(^TABIDENT(WHOIS,"START")) S PIM=PIM+1,^PIMEN($I)=PIM,^PIMEN($I,PIM)=^TABIDENT(WHOIS,"START")
 ;D:'($D(^%PK("TERMST"))) ^%PKINIT ;HL003 initialiser PK si besoin
 D:'$D(^%PK) ^%PKINIT ;HL003 initialiser PK si besoin
 S COUNT=0,MA=^PIMEN($I,PIM),SWIT="" D STARS^%VACTIME

FIN 
 K ^TABIDENT($I)
 D NORM^%VVIDEO,CLEPAG^%VVIDEO,ECHON^%VVIDEO,CURON^%VVIDEO
 Q
KILL K ^TABIDENT($I) Q
TUER N ITOL,%ITOL
 K ^GM1($I),^GLOMENU($I),^MEN($I),^GM2($I),^GM3($I),^GM4($I),^GM5($I),^GM6($I)
 S ITOL="" F %ITOL=0:0 S ITOL=$O(^TOLISRAM($I,ITOL)) Q:ITOL=""  K ^TOLISRAM($I,ITOL)
 Q
TUERALL K ^GM1,^GLOMENU,^MEN,^GM2,^GM3,^GM4,^GM5,^GM6
 Q
INIT ;Initialisation de la video
 D ^%VACTZIN S IOP=0 D ^%IS
 D NORM^%VVIDEO,80^%VVIDEO,OFSCRL^%VVIDEO,CRTSAVE^%VVIDEO
 Q
 
 
SAVMNL N OLDW,A,B,C
 Q:'($D(^TOLISRAM($I,30)))  S OLDW=^GDERWH($I),A=""
SAV2 S A=$O(^TOLISRAM($I,30,A)) Q:A=""  S:$D(^TOLISRAM($I,30,A))#10 ^GDERWH($I,OLDW,A)=^TOLISRAM($I,30,A) S B=""
SAV3 S B=$O(^TOLISRAM($I,30,A,B)) G:B="" SAV2 S:$D(^TOLISRAM($I,30,A,B))#10 ^GDERWH($I,OLDW,A,B)=^TOLISRAM($I,30,A,B) S C=""
SAV4 S C=$O(^TOLISRAM($I,30,A,B,C)) G:C="" SAV3 S:$D(^TOLISRAM($I,30,A,B,C))#10 ^GDERWH($I,OLDW,A,B,C)=^TOLISRAM($I,30,A,B,C) G SAV4
 
 
RESMNL N A,B,C
 Q:'($D(^GDERWH($I,WHOIS)))  S A=""
RES2 S A=$O(^GDERWH($I,WHOIS,A)) Q:A=""  S:$D(^GDERWH($I,WHOIS,A))#10 ^TOLISRAM($I,30,A)=^GDERWH($I,WHOIS,A) S B=""
RES3 S B=$O(^GDERWH($I,WHOIS,A,B)) G:B="" RES2 S:$D(^GDERWH($I,WHOIS,A,B))#10 ^TOLISRAM($I,30,A,B)=^GDERWH($I,WHOIS,A,B) S C=""
RES4 S C=$O(^GDERWH($I,WHOIS,A,B,C)) G:C="" RES3 S:$D(^GDERWH($I,WHOIS,A,B,C))#10 ^TOLISRAM($I,30,A,B,C)=^GDERWH($I,WHOIS,A,B,C) G RES4
Q

FIN2
 D CLEPAG^%VVIDEO
 D NORM^%VVIDEO 
 W !!,Y1," : inconnu...",!,"CONSEIL : Votre partition n'a pas été déclarée,",!,"          Vous pouvez l'enregistrer depuis la partition DMO (version démo)",!! R "[RETURN]",*TMP:180 G FIN 
 G FIN



