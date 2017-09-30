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

;%QMEXLCR^INT^1^59547,73878^0
%QMEXLCR ;;05:36 PM  21 Oct 1992; ; 30 Oct 92  3:47 PM
 
 
 
 
 
AJ 
 N ABENDSCR,RESUL,NO1,NO2,INDL,GL,AFF,I,%I,VAL,REPN,REPL
 S REPN="ETAT.RESEAU",REPL=$$LIENI^%QSGEL3
 K RESUL S LIBA=$$^%QZCHW("Ajouter"),RESUL(3)=LIBA
AJ2 D CLEPAG^%VVIDEO,AFF^%VACTGRQ("QMEXLI1",.RESUL)
 Q:ABENDSCR
 S NO1=$$GETLBLAN^%VTLBLAN(RESUL(1)),NO2=$$GETLBLAN^%VTLBLAN(RESUL(2))
 Q:(NO1="")&(NO2="")
 I (NO1="")!(NO2="") D ^%VSQUEAK G AJ2
 I $$VAIR^%QSGE5(REPN,ATN_","_NO1,"ETAT.PRECEDE",ATN_","_NO2) D ^%VZEAVT($$^%QZCHW("Il existe deja une transition entre ces 2 noeuds...")) G AJ2
 D ADDS^%QSGEST3(REPN,ATN_","_NO1,"ETAT.PRECEDE",REPN,ATN_","_NO2)
 S INDL=$$DERNL^%QSGES21(REPN,ATN_","_NO1,"ETAT.PRECEDE")
 G:INDL="" BOUC
 I '($$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("Voulez-vous associer un predicat a cette transition ?"))) G BOUC
 S Y1="" D POCLEPA^%VVIDEO W $$^%QZCHW("Predicat : ") S DX=$X,DY=$Y D ^%VLEC
 G:Y1="" BOUC
 D ^%PSPRSA1(Y1,2,15)
 D PA^%QSGESTI(REPL,INDL,"PREDICAT",Y1,1)
BOUC K RESUL S RESUL(3)=LIBA
 G AJ2
 
 
 
 
UC N LNODE,N,%N
 S REFUSE=0
 Q:RESUL(IC)=""
 S PARA=$$GETLBLAN^%VTLBLAN(RESUL(IC))
 I PARA'="?" G UCC
 S LNODE=$$TEMP^%SGUTIL
 S N="" F %N=0:0 S N=$$NXTRIAO^%QSTRUC8("RESEAU",ATN,"ETAT.RESEAU",N) Q:N=""  S @LNODE@(N)=""
 S RESUL(IC)=$$^%QUCHOIX(LNODE,1,"",0,7,80,16) K @(LNODE) S:RESUL(IC)="" REFUSE=1 Q
UCC 
 I '($$IR^%QSGEST5(REPN,ATN_","_PARA)) D ^%VZEAVT($$^%QZCHW("Noeud inexistant...")) S REFUSE=1
 Q

