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

;LKBRP0^INT^1^59547,74867^0
LKBRP0 ;
 
 
 
 
 
 
 
 
 
 N Y1,IO,FILE,TYPE,ABANDON,GLO,NBR,LISTE
 S GLO="^[QUI]TEMPO(""BPH"")" K @(GLO)
DEB S ABANDON=0,NBR=0
 D CURRENT^%IS,VARSYS^%QCSAP,CLEPAG^%VVIDEO
 D ^%VZCDB("ACTIVATION D'UNE PASERELLE POUR UN FICHIER NEUTRAL_FILE",0)
 
 S DY=2
1 S ABANDON=0,YY=4,FILE="" D LEC("NET",YY,.ABANDON,.FILE) Q:ABANDON
 I $D(LISTE(FILE)) D ^%VZEAVT("fichier deja lu") G 1
 S RETOUR=1
 D OPEN(FILE,.OK)
 G:'(OK) 1
 D READ,CLOSE(FILE)
 
3 S ABANDON=0,YY=6,FILE="" D LEC("GEOM",YY,.ABANDON,.FILE) Q:ABANDON
 I $D(LISTE(FILE)) D ^%VZEAVT("fichier deja lu") G 3
 S RETOUR=3
 D OPEN(FILE,.OK)
 G:'(OK) 3
 D READ2("GEOM"),CLOSE(FILE)
 
4 S ABANDON=0,YY=8,FILE="" D LEC("COMP",YY,.ABANDON,.FILE) Q:ABANDON
 I $D(LISTE(FILE)) D ^%VZEAVT("fichier deja lu") G 4
 S RETOUR=4
 D OPEN(FILE,.OK)
 G:'(OK) 4
 D READ2("COMP"),CLOSE(FILE)
 
5 S ABANDON=0,YY=10,FILE="" D LEC("HOLE",YY,.ABANDON,.FILE) Q:ABANDON
 I $D(LISTE(FILE)) D ^%VZEAVT("fichier deja lu") G 5
 S RETOUR=5
 D OPEN(FILE,.OK)
 G:'(OK) 5
 D READ2("HOLE"),CLOSE(FILE)
 Q
 
LEC(TYPE,YY,ABANDON,FILE) 
LEC1 
 S DX=0,DY=YY X XY W $J(" ",79)
 S DX=10 X XY W "donnez le nom du fichier de type '"_TYPE_"' : " S DX=$X D ^%VLEC
 I CTRLA!(Y1="") S ABANDON=1 Q
 I Y1'[":" D ^%VZEAVT("mauvaise syntaxe") G LEC1
 S FILE=Y1
 Q
 
OPEN(FILE,OK) 
 S OK=1
 S $ZT="G BADOPEN^LKBRP0"
 I DTM S IO=19 O IO:("R":FILE):15
 E  S IO=FILE O IO
 S $ZT=""
 Q
CLOSE(FILE) 
 C IO
 Q
READ2(TYPE) 
 N LG
 S LG=$L(TYPE)
 F I=0:0 U IO R ENR Q:ENR=""  I $E(ENR,1,LG)=TYPE S @GLO@(NBR)=ENR Q
READ 
 F I=0:0 U IO R ENR Q:ENR=""  S NBR=NBR+1,@GLO@(NBR)=ENR
 Q
 
BADOPEN 
 S $ZT="",OK=0
 D POCLEPA^%VVIDEO,^%VZEAVT("erreur d'ouverture du fichier")
 K Y1,FILE
 Q

