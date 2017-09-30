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

;%MZREL^INT^1^59547,73872^0
MOZUC ;
 
OPER S REFUSE=1 F ROP="=","'=","<","'<",">","'>","[]","[[","]]","][","[","]","'[","']" I RESUL(IC)=ROP S REFUSE=0 G FIN
 S REFUSE=1 F ROP="#^'=",">=^'<","=>^'<","=<^'>","<=^'>" I RESUL(IC)=$P(ROP,"^",1) S REFUSE=0,ICC=IC,TAB(ICC)=$P(ROP,"^",2) D ^%VAFFICH G FIN
FIN Q
POP S %IT2=3 G NUDIM3
NUDIM3 S REFUSE=1,%RE="" F %IT=1:1:%IT2 G:'($D(RESUL(%IT))) FNUD G:RESUL(%IT)="" FNUD S %RE=%RE_$S(%RE="":"",1:",")_""""_RESUL(%IT)_""""
 I RESUL(IC)="SINON" S REFUSE=0 G FNUD
NUDIM4 S %TB=NOMTAB_"("_%RE_")",REFUSE=0 I '($D(@%TB)) S ICC=IC,TAB(IC)=1 D ^%VAFFICH G FNUD
 S (%ITR,%IT)=-1 F %ITT=1:1 S %IT=$N(@%TB@(%IT)) Q:%IT=-1  S %ITR=%IT
 S ICC=IC,TAB(IC)=$S(%ITR=-1:1,1:%ITR+1) D ^%VAFFICH
FNUD K %IT,TAB,%ITT,%ITR,%RE,%TB G FIN
TYPREL

