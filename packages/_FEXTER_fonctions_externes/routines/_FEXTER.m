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

%FEXTER
 Q


RLWEB(RECHERCHE,MOTEUR,NBPAGE,REPERTOIRE,NOM,FICHIER) ;RECHERCHER.LIENS.WEB
 ;Q:'$D(RECHERCHE) 0
 S INSTANCE=$P($ZDIRECTORY,"/",3)
 S AUTEUR=QUI
 S R=RECHERCHE_"."
 S R2=$P(R," ",1) F i=2:1:999 S P="",P=$P(R," ",i) S:P'="" R2=R2_"+"_P
 S R3=$P(R2,"'",1) F i=2:1:999 S P="",P=$P(R2,"'",i) S:P'="" R3=R3_":"_P
 S R4=$P(R3,"""",1) F i=2:1:999 S P="",P=$P(R3,"""",i) S:P'="" R4=R4_"#"_P
 S R5=$P(R3,".",1) F i=2:1:999 S P="",P=$P(R3,".",i) S:P'="" R4=R4_"."_P
 S RECHERCHE=R5
 I NBPAGE="" S NBPAGE=1
 I REPERTOIRE="" S REPERTOIRE="INTERFACE"
 D POCLEPA^%VVIDEO W $$^%QZCHW("RECHERCHER.LIENS.WEB, un instant...") ; H 1
 ZSY "../../../scripts/RECHERCHER.LIENS.WEB.py -i '"_INSTANCE_"' -a '"_AUTEUR_"' -r '"_RECHERCHE_"' -m '"_MOTEUR_"' -p '"_NBPAGE_"' -e '"_REPERTOIRE_"' -n '"_NOM_"' -f '"_FICHIER_"'"
 Q

;view "LINK":"RECURSIVE" zl "_FEXTER" D RLWEB^%FEXTER("'système expert YRexpert'","GOOGLE","","","RLWEB20200001","../tmp/RLWEB20200001.IND")
TEST
 S RECHERCHE="système expert"
 S MOTEUR="STARTPAGE"
 S NBPAGE=2
 S REPERTOIRE="CACHE"
 S NOM="RLWEB2020001"
 S FICHIER="RLWEB2020001.IND"
 D RLWEB^%FEXTER(RECHERCHE,MOTEUR,NBPAGE,REPERTOIRE,NOM,FICHIER)
 Q




