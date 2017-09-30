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

;%SYAPPEL^INT^1^59566,69844^0
%SYAPPEL ;
 
 
 
 
 
 
 
DEB0 
 N LISTE,EXPL,I,CH,MAJROUT
 D CURRENT^%IS,VARSYS^%QCSAP,INT^%DIR,INIT
 D CLEPAG^%VVIDEO
 S DX=20,DY=11 X XY W "vous etes sur la partition "_%DIR
 S DX=17,DY=13 X XY W %DIR_" doit etre la partition systeme" R *R
DEB D CLEPAG^%VVIDEO
 W "                           ","Gestion des logiciels YRELAY",!
 W "                           ","----------------------------"
 W !,!,!
 W "liste des systemes d'exploitation ==>"
 W !,!,"          "
 S EXPL="" F I=1:1 S EXPL=$O(LISTE(EXPL)) Q:EXPL=""  W "        ",EXPL
 W !,!,!
 W "quel systeme d'exploitation ? " R EXPL
 S EXPL=$$GETLBLAN^%VTLBLAN(EXPL)
 Q:EXPL=""
 I '($D(LISTE(EXPL))) D MSG("inconnu") G DEB
 
 S MAJROUT="ZR  ZL @ROUTSPEC ZS @NOUROUT"
 
 F I=0:1 S CH=$T(ROUT+I),CH=$P(CH,";;",2) Q:CH=""  D EXTRAC
 D MSG("                    ===========> installation terminee <============")
FIN 
 D CLEPAG^%VVIDEO
 Q
MSG(M) 
 N R
 S DX=0,DY=23 X XY W $J("",79)
 X XY W M,*7
 R *R
 Q
INIT 
 N I,J,CH,SSCH
 F I=0:1 S CH=$T(EXPL+I),CH=$P(CH,";;",2) Q:CH=""  F J=1:1 S SSCH=$P(CH,"///",J) Q:SSCH=""  S LISTE(SSCH)=""
 Q
 
EXTRAC 
 N SSCH,ROUTSPEC,NOUROUT,LIB
 S SSCH=$P(CH,"///")
 S ROUTSPEC=$S(EXPL="MV/M":$P(SSCH,",",4),EXPL="DTM":$P(SSCH,",",3),EXPL="MVX":$P(SSCH,",",2),EXPL="DTMVX":$P(SSCH,",",5),1:$P(SSCH,",",1)),ROUTSPEC=$P(ROUTSPEC,"^",2)
 S NOUROUT=$P(CH,"///",2),NOUROUT=$P(NOUROUT,"^",2),LIB=$P(CH,"///",3)
 W !,"        ",ROUTSPEC,"   ------------>  ",NOUROUT,"    ",LIB
 X MAJROUT
 Q
EXPL ;;M11///MVX///DTM///MV/M///DTMVX
 ;;
 
 
 
ROUT ;;^%SY1AMEN,^%SY2AMEN,^%SY3AMEN,^%SY4AMEN,^%SY5AMEN///^%SYSAMEN///menu outils systemes
 ;;^%SY1CARU,^%SY2CARU,^%SY3CARU,^%SY4CARU,^%SY5CARU///^%SYSCARU///carousel
 ;;^%SY1LIB1,^%SY2LIB1,^%SY3LIB1,^%SY4LIB1,^%SY5LIB1///^%SYSLIB1///libelles des messages
 ;;^%SY1LIB2,^%SY2LIB2,^%SY3LIB2,^%SY4LIB2,^%SY5LIB2///^%SYSLIB2///libelles des messages
 ;;^%SY1LIB3,^%SY2LIB3,^%SY3LIB3,^%SY4LIB3,^%SY5LIB3///^%SYSLIB3///libelles des messages
 ;;^%SY1DEF,^%SY2DEF,^%SY3DEF,^%SY4DEF,^%SY5DEF///^%SYSDEF///liste des globals
 ;;^%SY1ROUT,^%SY2ROUT,^%SY3ROUT,^%SY4ROUT,^%SY5ROUT///^%SYSROUT///utilit. gestion de routines
 ;;^%SY1SAVE,^%SY2SAVE,^%SY3SAVE,^%SY4SAVE,^%SY5SAVE///^%SYSSAVE///sauvegarde de globals
 ;;^%SY1SMEN,^%SY2SMEN,^%SY3SMEN,^%SY4SMEN,^%SY5SMEN///^%SYSSMEN///menu des sauvegardes
 ;;^%SY1SEMA,^%SY2SEMA,^%SY3SEMA,^%SY4SEMA,^%SY5SEMA///^%SYSSEMA///semaphores
 ;;^%SY1UTI1,^%SY2UTI1,^%SY3UTI1,^%SY4UTI1,^%SY5UTI1///^%SYSUTI1///utilitaires 1
 ;;^%SY1CLAV,^%SY2CLAV,^%SY3CLAV,^%SY4CLAV,^%SY5CLAV///^%SYSCLAV///interface clavier
 ;;

