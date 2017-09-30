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

;%DLJANA2^INT^1^59547,73868^0
DLJANA2 ;
 
ABAQUE 
 D VALSUIV^%DLJANAL
 D EMPVAL^%DLJANAL("VIRG")
 S COMP=COMP_"$$ABAQUE^%DLJEVAL("
 S POS=POS+8
 S VIRG=1
 D EMPAD^%DLJANAL("AB1^%DLJANA2")
 G EXPR1^%DLJANAL
AB1 G:ERREUR DEPVAL^%DLJANAL
 I C'="," S MERR=$$^%QZCHW("Une , etait attendue"),ERREUR=1 D:VISU ^%VZEAVT(MERR) G DEPVAL^%DLJANAL
 S POS=POS+1,COMP=COMP_","
 D EMPAD^%DLJANAL("AB2^%DLJANA2")
 G EXPR1^%DLJANAL
AB2 G:ERREUR DEPVAL^%DLJANAL
 I C'="," S MERR=$$^%QZCHW("Une , etait attendue"),ERREUR=1 D:VISU ^%VZEAVT(MERR) G DEPVAL^%DLJANAL
 S POS=POS+1,COMP=COMP_","
 D EMPAD^%DLJANAL("AB3^%DLJANA2")
 G EXPR1^%DLJANAL
AB3 G:ERREUR DEPVAL^%DLJANAL
 I C=")" S COMP=COMP_",""""" G ABF
 I C'="," S MERR=$$^%QZCHW("Une , etait attendue"),ERREUR=1 D:VISU ^%VZEAVT(MERR) G DEPVAL^%DLJANAL
 S POS=POS+1,COMP=COMP_",",VIRG=0
 D EMPAD^%DLJANAL("AB4^%DLJANA2")
 G EXPR1^%DLJANAL
AB4 G:ERREUR DEPVAL^%DLJANAL
 I C'=")" S MERR=$$^%QZCHW("Une ) etait attendue"),ERREUR=1 D:VISU ^%VZEAVT(MERR) G DEPVAL^%DLJANAL
ABF S COMP=COMP_")",POS=POS+1
 G DEPVAL^%DLJANAL
 
MAX D VALSUIV^%DLJANAL
 D EMPVAL^%DLJANAL("VIRG")
 S COMP=COMP_"$$MAX^%DLJEVAL("
 S POS=POS+5
 S VIRG=1
 D EMPAD^%DLJANAL("MA1^%DLJANA2")
 G EXPR1^%DLJANAL
MA1 G:ERREUR DEPVAL^%DLJANAL
 I C'="," S MERR=$$^%QZCHW("Une , etait attendue"),ERREUR=1 D:VISU ^%VZEAVT(MERR) G DEPVAL^%DLJANAL
 S POS=POS+1,COMP=COMP_",",VIRG=0
 D EMPAD^%DLJANAL("MA2^%DLJANA2")
 G EXPR1^%DLJANAL
MA2 G:ERREUR DEPVAL^%DLJANAL
 I C'=")" S MERR=$$^%QZCHW("Une ) etait attendue"),ERREUR=1 D:VISU ^%VZEAVT(MERR) G DEPVAL^%DLJANAL
 S COMP=COMP_")",POS=POS+1
 G DEPVAL^%DLJANAL
 ;

