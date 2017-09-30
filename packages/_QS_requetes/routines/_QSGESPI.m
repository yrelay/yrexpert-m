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

;%QSGESPI^INT^1^59547,73881^0
%QSGESPI ;
 
 
 
 
INIT 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N A,ATR,C,CONT,CONT2,I,ORD,REP,ROUT,TYP
 
 
 
 
 
 S CONT=$P($T(LEX),";;",2)
 F I=1:1 S ATR=$P(CONT,"/",I) Q:ATR=""  D STOCK^%LXMRUC(ATR,"Attribut special","","","","","","","","")
 
 F I=0:2 S A=$T(FUN+I) Q:A=""  D INSER
 
 D SUPREM^%QSGESPE
 Q
INSER 
 S CONT=$P(A,";;",2),ATR=$P(CONT,"/",1),CONT=$P(CONT,"/",2,10)
 D SUP^%QSGESPE(ATR)
 D DET(CONT),CREM^%QSGESPE(ATR,ORD,TYP,ROUT,REP)
 S CONT2=$P($T(FUN+I+1),";;",2)
 D DET(CONT2),CREA^%QSGESPE(ATR,ORD,TYP,ROUT,REP)
 Q
DET(C) 
 S TYP=$P(C,";",1),ORD=$P($P(C,";",2),"/",1),C=$P(C,"/",2,10)
 S ROUT=$P(C,"/",1),C=$P(C,"/",2,10)
 S REP=$P(C,"/",1) Q
 
 
 
 
 
 
ATTLIEN(VAL) 
 N BASE
 S BASE=$$ONE^%QSGEL3("TRAITEMENT")
 S:BASE'="" @VAL@("REGLE","*",BASE)=""
 S BASE=$$ONE^%QSGEL3("SAISIE")
 S @VAL@("REGLE","*",BASE)=""
 Q
 
LEX ;;TYPE.MISE.A.JOUR/ROUTINE.MISE.A.JOUR/BASE.MISE.A.JOUR/TYPE.AFFICHAGE/ROUTINE.AFFICHAGE/BASE.AFFICHAGE/NOTE
 
FUN ;;NOTE/TEXTE;TEXTE/^%QSNOTE/*
 ;;/;//
 ;;REGLE/REGLE;REGLE/^%QMERREG/*
 ;;/;//
 ;;AIDE/AIDE;AIDE/^%QMERRGA/*
 ;;/;//
 ;;INDICE.NOTE/INDICE.NOTE;INDICE.NOTE/^%QMERRGA/*
 ;;/;//
 ;;HISTOGRAMME/HISTO;HISTO/^%QSNHIST/*
 ;;/;//
 ;;COMMENTAIRE.PROLOGUE/TEXTE;TEXTE/^%QSNOTE/*
 ;;/;//
 ;;COMMENTAIRE.EPILOGUE/TEXTE;TEXTE/^%QSNOTE/*
 ;;/;//
 ;;CONDITION.TRANSITION/CONDITION;CONDITION/^%QMEBCDT/*
 ;;/;//
 ;;PREDICAT/PREDICAT;PREDICAT/^%PSPRATT/*
 ;;/;//
 ;;PRESENTATION/TEXTE;TEXTE/^%QSNOTE/*
 ;;/;//
 ;;COLLECTION/COLLECTION;COLLECTION/^%QSDESSI/*
 ;;/;//
 ;;
 ;
 ;
 ;

