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

;TORQSTR^INT^1^59547,74875^0
TORQSTR ;
 
 
 
 
 
 N TAB,GLOER,LEX
 D CLEPAG^%VVIDEO,^%VZCD0("Passerelle Postes de travail"),POCLEPA^%VVIDEO W $$^%QZCHW("Un instant"),"..." S DX=0,DY=6 X XY
 S GLOER=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 K @(GLOER)
 S @GLOER=0
 S LEX=$$OKR^%INCOIN("TO")
 S BASE="POSTE.DE.TRAVAIL",GLO1=$$LISTIND^%QSGEST6(BASE)
 S IND="" F II=1:1 S IND=$O(@GLO1@(IND)) Q:IND=""  W "." D INSER
 I @GLOER'=0 D AFFERR^%QULIMZ(GLOER,$$^%QZCHW("Erreurs lors de la mise a jour"))
 K @(GLOER)
 Q
INSER K TAB
 S FAM=$$^%QSCALVA(BASE,IND,"FAMILLE.POSTE")
 G:FAM'="" INSERCT
 I $D(^[QUI]DESMACH(IND)) S FAM=$O(^[QUI]DESMACH(IND,"")) G INSER1
 S FAM=IND
 G INSER1
INSERCT I $D(^[QUI]DESMACH(IND))&('($D(^[QUI]DESMACH(IND,FAM)))) S CPT=@GLOER+1,@GLOER@(CPT)=$$^%QZCHW("La machine")_" "_IND_" "_$$^%QZCHW("existe deja pour une autre section"),@GLOER=CPT Q
INSER1 S CONT="",TAB("FAMILLE.POSTE")=1,TAB("NOM")=1
 F ATT="NUMERO.POSTE","TAUX.HORAIRE","NOMBRE.HEURES.JOURNALIERES","NOMBRE.HEURES.PLANIFIEES","CHARGE.MAXI","UNITE.DE.CHARGE","REGIME.POSTE" S TAB(ATT)=1,CONT=CONT_$$^%QSCALVA(BASE,IND,ATT)_"^"
 S CONT=$P(CONT,"^",1,$L(CONT,"^")-1)
 S ^[QUI]DESMACH(IND,FAM)=CONT
 S ATT="",CONT="",FICHE=1,NB=0 F III=1:1 S ATT=$O(@GLO1@(IND,ATT)) Q:ATT=""  I ('($D(TAB(ATT))))&('($D(^[QUI]RQSLIEN(BASE,ATT)))) S NB=NB+1,CONT=CONT_ATT_"^"_$$^%QSCALVA(BASE,IND,ATT)_"^^" D:NB=8 INSER2
 Q:LEX'=1
 I '($$EXIST^%LXSTOCK(IND)) D STOCK^%LXAJMOD(IND,$$^%QZCHW("Machine ou POSTE.DE.TRAVAIL"),$S(IND'=FAM:"",1:$$^%QZCHW("Section ou FAMILLE.POSTE")),"","","","","","")
 Q:IND=FAM
 I '($$EXIST^%LXSTOCK(FAM)) D STOCK^%LXAJMOD(FAM,$$^%QZCHW("Section ou FAMILLE.POSTE"),"","","","","","","")
 Q
INSER2 S CONT=$P(CONT,"^",1,$L(CONT,"^")-1)
 S ^[QUI]PEXPMACH(IND,FICHE)=CONT
 S FICHE=FICHE+1,CONT="",NB=0
 Q
 ;

