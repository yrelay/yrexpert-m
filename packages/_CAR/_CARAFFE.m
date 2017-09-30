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

;%CARAFFE^INT^1^59547,73867^0
%CARAFFE ;
 
 
 N GLOECH,ECH,TEMP,%E,CORR,X,MN,ADR,CTR,GLOETA
 S GLOECH="^CARGECH",GLOETA="^CARGETA"
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S GLAFF=$$CONCAS^%QZCHAD(TEMP,"AF"),MN=$$CONCAS^%QZCHAD(TEMP,"MN")
 S CORR=$$CONCAS^%QZCHAD(TEMP,"CO")
 S @MN="21^10^79"
 S @MN@(1)=$$^%QZCHW("Deprogrammer")_"^DEPROG"
 S @MN@(1,"COM")=$$^%QZCHW("Deprogrammer une activation")
 S @MN@(2)=$$^%QZCHW("Reafficher")_"^REAF"
 S @MN@(2,"COM")=$$^%QZCHW("Reafficher")
 S @MN@(3)=$$^%QZCHW("Examiner")_"^EXAM"
 S @MN@(3,"COM")=$$^%QZCHW("Examiner les caracteristiques d'une echeance")
 
 D COHER^%CARJOBE
 S MODECH=1
 
BCL D CLEPAG^%VVIDEO
 G:MODECH=0 BCLSU
 D ^%VZEATT
 K @(GLAFF)
 S ECH="" F %ECH=0:0 S ECH=$O(@GLOECH@("ECH",ECH)) Q:ECH=""  D PREPL
 D OFF^%VZEATT
 D INIT^%QUCHOIP(GLAFF,1,1,0,0,79,21)
 S MODECH=0
BCLSU D AFF^%QUCHOIP
 D ^%VQUIKMN(0,80,22,MN,.ADR,.CTR)
 G:ADR'="" @ADR
 D END^%QUCHOIP
 K @(TEMP)
 Q
DEPROG S CLEF=$$UN^%QUCHOIP
 S ECH=@CORR@(CLEF)
 I '($D(@GLOETA@("PLANIFIE"))) D ^%VZEAVT($$^%QZCHW("CETTE ACTIVATION A DEJA ETE LANCEE, VOUS NE POUVEZ LA DEPROGRAMMER")) G BCL
 K @GLOETA@("PLANIFIE",ECH)
 S ACTI=@GLOECH@("ECH",ECH,"ACT") K @GLOECH@("ECH",ECH),@GLOECH@("ACT",ACT,"ECH",ECH)
 D END^%QUCHOIP
 S MODECH=1
 G BCL
 
REAF 
 D END^%QUCHOIP
 S MODECH=1
 G BCL
 
EXAM 
 S CLEF=$$UN^%QUCHOIP
 S ECH=@CORR@(CLEF)
 D ^%CARTAC(ECH)
 G BCL
 
PREPL S ACT=@GLOECH@("ECH",ECH,"ACT"),TRT=@GLOECH@("ACT",ACT,"TRT"),LISTE=@GLOECH@("ACT",ACT,"LISTE")
 S TY=" "
 F TYPET="PLANIFIE","ATTENTE","INTERROMPU","LANCE","FINI" I $D(@GLOETA@(TYPET,ECH)) S TY=$E(TYPET) Q
 S X=ECH_$S($L(ECH)=12:"00",$L(ECH)=13:"0",1:"")_"          "_ACT_"       "_TRT_"     "_LISTE_"  "_TY,@GLAFF@(X)="",@CORR@(X)=ECH
 Q

