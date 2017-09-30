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

;%QNEQPR3^INT^1^59547,73879^0
QNEQPR3 ;
 
 
 
 
ENTETE(RETU,ETU,NOMEN,TYPO,PORT,TERM) 
 N EPA,TAILLE,H,L
 S EPA=5E-1
 S TAILLE=10
 S (H,L)=1
 D CLEAR^%PBPZPR(PORT,TERM)
 
 D TRAIT^%PBPZPR(PORT,TERM,EPA,0*L,0*H,0*L,277E-1*H)
 D TRAIT^%PBPZPR(PORT,TERM,EPA,0*L,0*H,20*L,0*H)
 D TRAIT^%PBPZPR(PORT,TERM,EPA,0*L,277E-1*H,20*L,277E-1*H)
 D TRAIT^%PBPZPR(PORT,TERM,EPA,20*L,277E-1*H,20*L,0*H)
 S EPA=3E-1
 D TRAIT^%PBPZPR(PORT,TERM,EPA,0*L,1*H,6*L,1*H)
 D TRAIT^%PBPZPR(PORT,TERM,EPA,0*L,2*H,20*L,2*H)
 D TRAIT^%PBPZPR(PORT,TERM,EPA,6*L,0*H,6*L,2*H)
 D TRAIT^%PBPZPR(PORT,TERM,EPA,0*L,35E-1*H,20*L,35E-1*H)
 D TRAIT^%PBPZPR(PORT,TERM,EPA,0*L,25E-1*H,20*L,25E-1*H)
 S TAILLE=11
 
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,12E-1*L,18E-1*H,WHOIS)
 
 
 I TYPO=0 D PLACER^%PBPZPR(PORT,TERM,TAILLE,8*L,24E-1*H,$$^%QZCHW("DESCRIPTION DE POSTE"))
 I TYPO=1 D PLACER^%PBPZPR(PORT,TERM,TAILLE,75E-1*L,24E-1*H,$$^%QZCHW("NOMENCLATURE DU POSTE"))
 I TYPO=2 D PLACER^%PBPZPR(PORT,TERM,TAILLE,85E-1*L,24E-1*H,$$^%QZCHW("OUTILLAGE"))
 D HACHUREF^%PBPZPR(PORT,TERM,EPA,0*L,2*H,20*L,5E-1*H)
 
 S TAILLE=12
 I TYPO=0 D PLACER^%PBPZPR(PORT,TERM,TAILLE,1*L,29E-1*H,$$^%QZCHW("Num{ro Op{ration"))
 I TYPO=0 D PLACER^%PBPZPR(PORT,TERM,TAILLE,8*L,29E-1*H,$$^%QZCHW("Mode op{ratoire"))
 I TYPO=0 D PLACER^%PBPZPR(PORT,TERM,TAILLE,16*L,29E-1*H,$$^%QZCHW("Temps"))
 
 I TYPO=1 D PLACER^%PBPZPR(PORT,TERM,TAILLE,15E-1*L,29E-1*H,$$^%QZCHW("Ref{rence")_" :")
 I TYPO=1 D PLACER^%PBPZPR(PORT,TERM,TAILLE,8*L,29E-1*H,$$^%QZCHW("Libell{"))
 I TYPO=1 D PLACER^%PBPZPR(PORT,TERM,TAILLE,16*L,29E-1*H,$$^%QZCHW("Quantit{"))
 
 I TYPO=2 D PLACER^%PBPZPR(PORT,TERM,TAILLE,15E-1*L,29E-1*H,$$^%QZCHW("Ref{rence")_" :")
 I TYPO=2 D PLACER^%PBPZPR(PORT,TERM,TAILLE,8*L,29E-1*H,$$^%QZCHW("D{signation outil"))
 
 
 D PLACER^%PBPZPR(PORT,TERM,14,75E-1*L,275E-1*H,$$^%QZCHW("Edite par M.W.M Informatique le ")_$$3^%QMDATE1)
 Q
 
ENTNOM N EPA,TAILLE
 S EPA=3E-1
 S TAILLE=12
 D TRAIT^%PBPZPR(PORT,TERM,EPA,0*L,16*H,20*L,16*H)
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,75E-1*L,164E-1*H,$$^%QZCHW("NOMENCLATURE DU POSTE"))
 D HACHUREF^%PBPZPR(PORT,TERM,EPA,0*L,16*H,20*L,5E-1*H)
 D TRAIT^%PBPZPR(PORT,TERM,EPA,0*L,165E-1*H,20*L,165E-1*H)
 D TRAIT^%PBPZPR(PORT,TERM,EPA,0*L,17*H,20*L,17*H)
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,15E-1*L,169E-1*H,$$^%QZCHW("Ref{rence")_" :")
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,8*L,169E-1*H,$$^%QZCHW("Libell{"))
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,16*L,169E-1*H,$$^%QZCHW("Quantit{"))
 Q

