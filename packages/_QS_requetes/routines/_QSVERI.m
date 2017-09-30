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

;%QSVERI^INT^1^59547,73883^0
QSVERI ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N VDEF,MES,DX1,DY1,CTR,YY1,M,TEMP,COL,HIER,RR,TABLI,NOLIEN,TEMPO,SYSVU,LREPCR
 
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S TEMPO=$$CONCAS^%QZCHAD(TEMP,"TEMPO")
 S COL=$$CONCAS^%QZCHAD(TEMP,"COL")
 S HIER=$$CONCAS^%QZCHAD(TEMP,"HIER")
 S RR=$$CONCAS^%QZCHAD(TEMP,"RR")
 S TABLI=$$CONCAS^%QZCHAD(TEMP,"TABLIEN")
 S NOLIEN=$$CONCAS^%QZCHAD(TEMP,"NOMLIEN")
 S SYSVU=$$CONCAS^%QZCHAD(TEMP,"SYSVU")
 S LREPCR=$$CONCAS^%QZCHAD(TEMP,"LREPCR")
 
VDEF S YY1="",VDEF=" ",MES=$$^%QZCHW("Nom du schema : "),DX1=10,DY1=10
 D S1^%VLECFL(VDEF,MES,DX1,DY1,.CTR,.YY1) Q:((CTR="A")!(CTR="F"))!(YY1=" ")
 I YY1'="?" S M=YY1 I '($D(^RQSMOD(M))) D ^%VZEAVT($$^%QZCHW("Schema inconnu... ")),CLEPAG^%VVIDEO G VDEF
 I YY1="?" S M=$$^%QUCHOYO("^RQSMOD",.R,1) D:M="" CLEPAG^%VVIDEO G:M="" VDEF I '($D(^RQSMOD(M))) D ^%VZEAVT($$^%QZCHW("Schema inconnu...")),CLEPAG^%VVIDEO G VDEF
 
GO D VERIF^%QSVERI0
 K @(TEMP)
 Q

