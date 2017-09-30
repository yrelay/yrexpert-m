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

;%DLAFFI1^INT^1^59547,73867^0
DLAFFI1 ;
 
 
 
 
 
 
 
 
 
ACCES 
 N COL,CS,LS,SEL,JAL
 D POCLEPA^%VVIDEO
 S (CS,LS)=1
ACC S SEL=$$^%VZEMOV(LMARG,(HFHA+HHIST)+1,NBCOL,HTEXT,ECART+LARG,1,TEXT,.CS,.LS)
 I '(SEL) S DY=22,DX=0 D CLEBAS^%VVIDEO Q
 S CS=(CS+NOCOL)-1,JAL=0
 I '($D(@HISTO@(CS))) D ^%VSQUEAK G ACC
 I @HISTO@(CS)=0 D ^%VSQUEAK G ACC
 D OPER(@HISTO@(CS,"TEXT"),@HISTO@(CS),TD)
 S ^DESC($J,"INTER")=1,^DESC($J,"MODI")=1
 S ^DESC($J,"PROG")="JAL^%DLAFFI1"
 D ^%QUKOLO K ^DESC($J)
 I JAL=1 D ^%VZEATT,INIT^%HXYPARA,MKCOL^%HXYIST2,MKGRA^%HXYIST2,MKTEX^%HXYPARA
 D CLEPAG^%VVIDEO,REAFF^%HXYPARA
 Q
 
OPER(JO,CHA,TD) 
 N %I,ADM,I,JOUR,L,LA,N,R,T
 D ^%VZEATT
 K ^DESC($J)
 S COL="^DESC($J)"
 S ^DESC($J,"MSG")=$$^%QZCHW($S(TD=0:"Jour",1:"Semaine"))_" : "_JO_"   ("_$$^%QZCHW("charge")_" "_CHA_")"
 S ^DESC($J,"TITC")=$$^%QZCHW("Article ou Operation")
 S T="CHARGE",R="NUMERO",LA="LANCEMENT"
 S ADM="^[QUI]MACOP"
 S ADM=$$CONCAS^%QZCHAD(ADM,MAC)
 S L=0
 I TD=1 S JOUR=""
 I TD=0 S JOUR=JO G BCL
BCJ 
 S JOUR=$O(@HISTO@(CS,"JOUR",JOUR)) I JOUR="" G FOPER
BCL 
 S I=""
 F %I=0:0 S I=$O(@ADM@(JOUR,I)) Q:I=""  S N="" D TI
 
 I TD=1 G BCJ
FOPER 
 S ^DESC($J,"LGC")=40
 S ^DESC($J,"COL",1)=$$^%QZCHW("Charge")_"^6^"_T
 S ^DESC($J,"COL",2)=$$^%QZCHW("Numero")_"^6^"_R
 S ^DESC($J,"COL",3)=$$^%QZCHW("Lancement")_"^15^"_LA
 Q
TI 
 S N=$O(@ADM@(JOUR,I,N)) Q:N=""
 S NOP=$O(@ADM@(JOUR,I,N,"")) G:NOP="" TI
 S L=L+1
 S ^DESC($J,L)=NOP,^DESC($J,L,T)=$P(@ADM@(JOUR,I,N,NOP),"^")
 S ^DESC($J,L,R)=N,^DESC($J,L,LA)=I
 G TI
 
JAL 
 N CTR,LIM,ERR,LRES,NBJO,SENS,LAN
 S (REAFF,SORTIE)=0
 S LAN=^DESC($J,%L,"LANCEMENT"),ETU=$$^%QSCALVA($$LAN^%DLCON2,LAN,"ETUDE")
SEM D POCLEPA^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Nombre de jours")_" : ","",0,RM-4,DY+1,DY-1,"","",.CTR,.NBJO)
 Q:CTR'=""
 I $$ENT^%QZNBN(NBJO)=0 G SEM
 S SENS=$$^%QSCALVA($$REP^%DLETUDE,ETU,"SENS.JALONNEMENT")
 S LIM=$$^%QSCALVA($$REP^%DLETUDE,ETU,"RESPECT.CAPACITES.MACHINES")
 S LRES=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ERREURS") K @(LRES)
 D MOUV^%DLANITF($$LAN^%DLCON2,LAN,^DESC($J,%L,"NUMERO"),NBJO,$S(SENS="AVAL":1,1:-1),$S(LIM=$$^%QZCHW("OUI"):1,LIM=$$^%QZCHW("NON"):0,1:2),LRES,.ERR)
 S (REAFF,SORTIE,JAL)=1
 Q

