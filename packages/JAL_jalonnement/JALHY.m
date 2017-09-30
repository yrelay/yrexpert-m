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

;JALHY^INT^1^59547,74867^0
JALHY ;
 
 
 
 
ESSAI N I,TD,TF,MA,UCH,J
 N VARI,CRIT,LVARI,COM,ER,LISTE
 S A="temps debut,temps fin,machine,unite de charge",J=1
 F I="TD","TF","MA","UCH" W !,$P(A,",",J)," : " R @(I) S J=J+1
 B  S UCH="UNITE.DE.COMPTE"
 
 S VARI="",LVARI=""
 S CRIT(1)="MACHINE="_MA
 S CRIT(1,"TETE")=0
 S CRIT(2)="DATE.JALON[]"_TD_","_TF
 S CRIT(2,"TETE")=0
 S COM="jalxx test"
 D SUPPRIME^%QSINTER("XXJAL1",0)
 S ER=$$CREER^%QSINTER("XXJAL1",$$GO^JALRPJ,.VARI,.CRIT,.LVARI,COM,1) B
 Q:ER=2
 S LISTE=$$ACTIVE^%QSINTER("XXJAL1","") B
 D ^ZHYHISTO(LISTE,UCH,DATE.JALON,1,1,"^JALHYSEL")
 Q
TEST N LISTE
 S LISTE="RQS87110010"
 S TOT="UNITE.DE.COMPTE"
 S REG="MACHINE"
 S NUM=0
 S INTERV=""
 S OPT="^JALHYSEL"
 D ^ZHYHISTO(LISTE,TOT,REG,NUM,INTERV,OPT)
 Q

