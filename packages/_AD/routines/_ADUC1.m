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

;%ADUC1^INT^1^59547,73865^0
%ADUC1 ;
 
 
 
 
LONG(N) 
 S REFUSE=0
 I $L(RESUL(IC))>N S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Ce champ ne doit pas depasser ")_N_$$^%QZCHW(" caracteres."))
 Q
EXMN 
 S REFUSE=0
 I $D(^MN(RESUL(IC))) S:^MN(RESUL(IC),"STATUT")="RESERVE" REFUSE=1 D:^MN(RESUL(IC),"STATUT")="RESERVE" ^%VZEAVT($$^%QZCHW("Nom de menu reserve Yrelay."))
 Q
NOOP 
 Q:%AJM'="A"
 I RESUL(IC)'="" S LEX=$L(RESUL(IC)),DX=$L(^%SCRE(SCR,IC,1))+^%SCRE(SCR,IC,2),DY=^%SCRE(SCR,IC,3) X XY F RS=1:1:LEX W " "
 S XPAR=RESUL(IC-1),ORD=-1 F RR=0:0 S ORDP=ORD,ORD=$N(^[QUI]MN(XPAR,ORD)) G:ORD=-1 AFFECT
AFFECT S RESUL(IC)=ORDP+1 S:ORDP=-1 RESUL(IC)=1 G ECRI
ECRI S DX=$L(^%SCRE(SCR,IC,1))+^%SCRE(SCR,IC,2),DY=^%SCRE(SCR,IC,3) X XY W RESUL(IC) Q
 
 
DEJEX 
 S REFUSE=0
 Q:%AJM="C"
 I RESUL(IC)="" S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Champ obligatoire")) Q
 I %AJM'="A" Q:RESUL(IC)=AFRESU(IC)
 D NUM^%VYCH
 I $D(^[QUI]MN(RESUL(IC-1),RESUL(IC))) S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Numero deja utilise pour ce menu."))
 Q
 ;

