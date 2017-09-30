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

;%QNEQPR2^INT^1^59547,73879^0
QNEQPR2 ;
 
 
RECAP(RETU,ETU,CATT,LLISTEN,PORT,TERM,START) 
 N EPA,TAILLE,L,H,PAS
 
 S EPA=5E-1
 
 S TAILLE=10
 
 S L=1
 
 S H=1
 S TAILLE=4
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,15E-1*L,START*H,$$^%QZCHW("No de POSTE et NOM"))
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,8*L,START*H,$$^%QZCHW("Nombre"))
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,8*L,(START+5E-1)*H,$$^%QZCHW("Op{rations"))
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,10*L,START*H,$$^%QZCHW("Effectif"))
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,12*L,START*H,$$^%QZCHW("Temps Execution"))
 
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,15*L,START*H,$$^%QZCHW("Concession"))
 
 Q
 
 
 
RECAPP(RETU,ETU,CATT,LLISTEN,PORT,TERM) 
 N OR,I,NBP,EFFECTIF,LI,MSG,NUMPOSTE
 S OR="",MSG="",NUMPOSTE=1
 S ADR=$$ADRLT^%QSGEST7(LLISTEN)
 I (ADR=0)!(ADR="") D TRI^%QSGES11(LLISTEN,.ADR)
 S OR=$O(@ADR@(""))
 D RECAP(RETU,ETU,CATT,LLISTEN,PORT,TERM,13)
 S MSG=$$RECAP1(RETU,ETU,CATT,LLISTEN,PORT,TERM,145E-1,.OR,.LI,.NUMPOSTE)
 F I=0:0 Q:OR=""  Q:MSG'=""  D CLEAR^%PBPZPR(PORT,TERM),RECAP(RETU,ETU,CATT,LLISTEN,PORT,TERM,5E-1) S MSG=$$RECAP1(RETU,ETU,CATT,LLISTEN,PORT,TERM,3,.OR,.LI,.NUMPOSTE)
 I MSG'="" Q MSG
 S EFFECTIF=$$EFFEC^%QNEQUI6(ETU)
 D RECAPN(RETU,ETU,PORT,TERM,LI,EFFECTIF,$$CARD^%QSGEST7(LLISTEN))
 Q ""
RECAPN(RETU,ETU,PORT,TERM,START,EFFECTIF,NBP) 
 N L,H
 
 S L=1
 
 S H=1
 D PLACER^%PBPZPR(PORT,TERM,11,2*L,START*H,$$^%QZCHW("Effectif Total")_" "_EFFECTIF_" "_$$^%QZCHW(" op{rateurs(trices) sur ")_NBP_" "_$$^%QZCHW("poste(s)"))
 Q
RECAP1(RETU,ETU,CATT,LLISTEN,PORT,TERM,START,OR,LI,NUMPOSTE) 
 N EPA,TAILLE,L,H,PAS,POSTE,ADR,I
 
 S EPA=5E-1
 
 S TAILLE=10
 
 S L=1
 
 S H=1
 S TAILLE=4
 
 S ADR=$$ADRLT^%QSGEST7(LLISTEN)
 S LI=START
 
 I (ADR=0)!(ADR="") D TRI^%QSGES11(LLISTEN,.ADR)
 
 F NUMPOSTE=NUMPOSTE:1 Q:OR=""  Q:LI>26  D RECAP11 S OR=$O(@ADR@(OR)),LI=LI+1
 
 Q ""
RECAP11 
 S POSTE=@ADR@(OR)
 D PLACER^%PBPZPR(PORT,TERM,11,5E-1*L,LI*H,$$^%QZCHW("Poste No")_" "_NUMPOSTE)
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,35E-1*L,LI*H,$$AFGR^%QFGRACT(POSTE))
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,9*L,LI*H,$$^%QSCALVA("L0",POSTE,"CARD"))
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,11*L,LI*H,$$^%QSCALVA("L0",POSTE,"EFFECTIF.POSTE"))
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,125E-1*L,LI*H,$J($$^%QSCALVA("L0",POSTE,"TEMPS.PAR.OPERATEUR"),6,2))
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,152E-1*L,LI*H,$J($$^%QSCALIN("L0",POSTE,"CONCESSION",CATT),3,2)_"%")
 Q

