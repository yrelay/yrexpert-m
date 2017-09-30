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

;%QWACR3^INT^1^59547,73886^0
QWACR3(REP,IND,NR,DOM) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N GCOMP,NUMCD,ERR,NOUV,NUMAC,ACRES,VAL,ORD
 S GCOMP=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""QW"",""C3"")",DOM)
 S GCOMP=$$CONCAS^%QZCHAD(GCOMP,NR)
 I $D(@GCOMP@("P"))<10 G G1
 
 S NUMCD=""
F10 S NUMCD=$O(@GCOMP@("P",NUMCD))
 Q:NUMCD="" 0
 I $D(@GCOMP@("P",NUMCD,"LIE")) G F10
F12 S $ZT="F25^%QWACR3",ERR="",$ZE=""
F20 I @(@GCOMP@("P",NUMCD,"E"))  S $ZT="" G F30
 S $ZT="" G F10
F25 S ERR=$ZE,$ZT=""
 
 G:$E(ERR,1,6)="<UNDEF" F10 G F20
F30 
 
 I $D(@GCOMP@("P",NUMCD,"AVEC")) S NUMCD=@GCOMP@("P",NUMCD,"AVEC") G F12
G1 S NOUV=1,NUMAC=""
G10 S NUMAC=$O(@GCOMP@("R",NUMAC)) Q:NUMAC="" 1-NOUV
 S ACRES=$O(@GCOMP@("R",NUMAC,""))
 
 
 S $ZT="G13^%QWACR3",$ZE=""
G12 S @("ORD="_@GCOMP@("R",NUMAC,ACRES,"O"))
G13 S ERR=$ZE,$ZT="",$ZE="" G:$E(ERR,1,6)="<UNDEF" G10 G:ERR'="" G12
 S $ZT="G25^%QWACR3"
 
G20 S @("VAL="_@GCOMP@("R",NUMAC,ACRES,"E"))
 
G25 S ERR=$ZE,$ZT="",$ZE="" G:$E(ERR,1,6)="<UNDEF" G10 G:ERR'="" G20
 
 I $$AFFECT^%QWSTOE(3,NR,NOUV,REP,IND,ACRES,ORD,VAL) S NOUV=0
 G G10

