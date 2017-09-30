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

;TORQSTRM^INT^1^59547,74875^0
TORQSTRM ;
 
 
 
 
 
 N TAB D CLEPAG^%VVIDEO,^%VZCD0("Passerelle matiere"),POCLEPA^%VVIDEO W $$^%QZCHW("Un instant"),"..." S DX=0,DY=6 X XY
 S BASE="MATIERES",GLO=$$LISTIND^%QSGEST6(BASE)
 S IND="" F II=1:1 S IND=$O(@GLO@(IND)) Q:IND=""  W "." D INSER
 Q
INSER K TAB S FAM=$$^%QSCALVA(BASE,IND,"FAMILLE.MATIERE"),CONT2="",TAB("FAMILLE.MATIERE")=1,TAB("MATIERES")=1 S:FAM="" FAM=IND
 F ATT="PRIX.UNITAIRE","QUANTITE.MATIERE","PRIX.UNITE" S TAB(ATT)=1,CONT2=CONT2_$$^%QSCALVA(BASE,IND,ATT)_"^"
 S CONT2=$P(CONT2,"^",1,$L(CONT2,"^")-1)
 S ATT="",CONT="",FICHE=1,NB=0 F III=1:1 S ATT=$O(@GLO@(IND,ATT)) Q:ATT=""  I ('($D(TAB(ATT))))&('($D(^[QUI]RQSLIEN(BASE,ATT)))) S NB=NB+1,CONT=CONT_ATT_"^"_$$^%QSCALVA(BASE,IND,ATT)_"^^" D:NB=5 INSER2
 I NB'=5 S BORNE=3*(5-NB) F III=1:1:BORNE S CONT=CONT_"^"
 Q:NB=5
INSER2 S:NB'=0 CONT=$P(CONT,"^",1,$L(CONT,"^")-1) S CONT=CONT_CONT2
 S ^[QUI]MATSTOCK(IND,FAM,FICHE)=CONT
 S FICHE=FICHE+1,CONT="",NB=0
 Q

