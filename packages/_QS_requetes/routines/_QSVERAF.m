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

;%QSVERAF^INT^1^59547,73883^0
QSVERAF(M) 
 
 
 
 
 
 
 
 
 
 N %L,%R,C,I,J,L,R,L2,R2,NI,NC,GL1,GL2,GL3,GL4
 N TEMP,COL,TEMPO
 S TEMP=$$CONCAS^%QZCHAD("^TEMPORAI",$J_","_$P($ZPOS,"^",2)) K @(TEMP)
 S TEMPO=$$CONCAS^%QZCHAD(TEMP,"TEMPO")
 S COL=$$CONCAS^%QZCHAD(TEMP,"COL")
 S GL1="^RQSMDL1",GL2="^RQSMDL2"
 S GL3="^RQSMDL3",GL4="^RQSMDL4"
 D ^%VZEATT
 
 S R="" F %R=0:0 S R=$O(@GL1@(M,R)) Q:R=""  D TR
 S R="" F %R=1:1 S R=$O(@GL2@(M,R)) Q:R=""  S L="" F %L=1:1 S L=$O(@GL2@(M,R,L)) Q:L=""  D T1
 S R="" F %R=1:1 S R=$O(@GL3@(M,R)) Q:R=""  S L="" F %L=1:1 S L=$O(@GL3@(M,R,L)) Q:L=""  D T2
 S R="" F %R=1:1 S R=$O(@GL4@(M,R)) Q:R=""  S L="" F %L=1:1 S L=$O(@GL4@(M,R,L)) Q:L=""  D T3
 D AFF^%QSVERI6
 K @(TEMP) Q
 
T1 S C=@GL2@(M,R,L),J=1 F I="R2","L2" S @I=$P(C,"^",J),J=J+1
 S:L2="" L2="~"_L
 S @TEMPO@(M,"LIES",R,R2,L)="2^"_L2
 S @TEMPO@(M,"LIES",R2,R,L2)="1^"_L
 Q
T2 S C=@GL3@(M,R,L),J=1 F I="R2","L2" S @I=$P(C,"^",J),J=J+1
 S:L2="" L2="~"_L
 S @TEMPO@(M,"LIES",R,R2,L)="3^"_L2
 S @TEMPO@(M,"LIES",R2,R,L2)="3^"_L
 Q
T3 S C=@GL4@(M,R,L),J=1 F I="L2" S @I=$P(C,"^",J),J=J+1
 S:L2="" L2="~"_L
 S @TEMPO@(M,"LIES",R,R,L)="4^"_L2
 S @TEMPO@(M,"LIES",R,R,L2)="5^"_L
 Q
 
TR S C=@GL1@(M,R),J=1 F I="NI","NC" S @I=$P(C,"^",J),J=J+1
 S @TEMPO@(M,"NOM INTERNE",R)=NI,@TEMPO@(M,"NOMBRE DE CLES",R)=NC
 Q
 
AUTO 
 D QSVERAF($$MODEL^%QSMODEL) Q

