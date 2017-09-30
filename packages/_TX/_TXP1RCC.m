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

;%TXP1RCC^INT^1^59547,74032^0
%TXP1RCC ;;07:17 PM  25 Jan 1993; ; 15 Jan 93  6:04 PM
 
 
 
 
 S LPB="^[QUI]etupb"
 S sommeil=1
 D INIVAR^%TXPETU
 S ARB="^[QUI]arb(ETUDE)",tapb="^[QUI]apb(ETUDE,ATELIER)",valpb="^[QUI]valpb(ETUDE,ATELIER)",tmax="^[QUI]tmax(ETUDE,ATELIER)"
 
BCLPB D DEBCRIT
 I $D(@LPB)<10 D FINCRIT H sommeil G BCLPB
 S pbcour=@LPB
 D FINCRIT
 S TABGEN="^[QUI]LPBDEF"
 
 S VAR="" F  S VAR=$O(@TABGEN@("VAR",VAR)) Q:VAR=""  S @VAR=@TABGEN@("VAR",VAR)
 S VAR="" F  S VAR=$O(@TABGEN@("TAB",VAR)) Q:VAR=""  S INDX="" F  S INDX=$O(@TABGEN@("TAB",VAR,INDX)) Q:INDX=""  S @VAR@(INDX)=@TABGEN@("TAB",VAR,INDX)
 
 S ipb=""
BCTRTPB G:$D(@LPB)<10 BCLPB
 D DEBCRIT
 S ipb=$O(@LPB@(ipb)) I ipb="" D FINCRIT G BCTRTPB
 I @LPB'=pbcour D FINCRIT G BCLPB
 
 I @LPB@(ipb)'="ATTENTE" D FINCRIT G BCTRTPB
 
 S @LPB@(ipb)="EN COURS"
 D FINCRIT
 
 S:'($D(^[QUI]cptpb($J))) ^[QUI]cptpb($J)=0 S ^[QUI]cptpb($J)=^[QUI]cptpb($J)+1,^[QUI]cptpb=^[QUI]cptpb+1
 
 D M2("resolution du pb "_ipb,$J(^[QUI]cptpb($J)/^[QUI]cptpb," ",2))
 S TMAX=@LPB@(ipb,"TMAX"),PB=@LPB@(ipb,"PB"),apb=@LPB@(ipb,"apb")
 S @LPB@(ipb,"fmi")=$$^%TXP2RD(@LPB@(ipb,"t"),@LPB@(ipb,"r"),@LPB@(ipb,"PB"))
 S @LPB@(ipb)="RESOLU"
 G BCTRTPB
 
 
DEBCRIT 
 L +^[QUI]SEMASOL("FILEPB"):1 E  W !,"probleme pour saisir le semaphore" G DEBCRIT
 Q
FINCRIT 
 L -^[QUI]SEMASOL("FILEPB")
 Q
M(M) N Y S Y="20,20\RLWY\1\\\",Y(1)=$E(M_"                                                      ",1,74)_"*" D ^%PKPOP Q
M2(M,M2) N Y S Y="20,20\RLWY\1\\\",Y(1)=$E(M_"                                               ",1,55)_$E(M2_"                 ",1,15)_"*" D ^%PKPOP Q

