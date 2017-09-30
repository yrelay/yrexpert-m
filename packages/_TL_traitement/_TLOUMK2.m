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

;%TLOUMK2^INT^1^59547,74030^0
%TLOUMK2 ;;05:01 PM  12 Mar 1992; ; 07 Jun 93  4:42 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 s ^%COMPIL("A","ATTRIBUT",1)="X ^%COMPIL(""A"",""ATTRIBUT"",1,$E(^[QUI]ANSA(^[QUI]ANSA(X,1),""TEXTE""))=""%"")"
 
 s ^%COMPIL("A","ATTRIBUT",1,0)="D COMPIL(I,^[QUI]ANSA(X,1)) X ^%COMPIL(""A"",""ATTRIBUT"",1,0,^[QUI]ANSA(X,2)'=0,^[QUI]ANSA(X,3)'=0)"
 
 s ^%COMPIL("A","ATTRIBUT",1,0,0,0)="D INSER(""S V(""_(I+1)_"")=1,V(""_(I+2)_"")=PARCO(""""REP""""),V(""_(I+3)_"")=PARCO(""""IND"""")"")"
 
 s ^%COMPIL("A","ATTRIBUT",1,0,0,1)="D INSER(""S V(""_(I+1)_"")=1"") D COMPCHEM(I+2,^[QUI]ANSA(X,3))"
 
 s ^%COMPIL("A","ATTRIBUT",1,0,1,0)="D COMPIL(I+1,^[QUI]ANSA(X,2)) D INSER(""S V(""_(I+2)_"")=PARCO(""""REP""""),V(""_(I+3)_"")=PARCO(""""IND"""")"")"
 
 s ^%COMPIL("A","ATTRIBUT",1,0,1,1)="D COMPIL(I+1,^[QUI]ANSA(X,2)) D COMPCHEM(I+2,^[QUI]ANSA(X,3))"
 
 s ^%COMPIL("A","ATTRIBUT",1,1)="D COMPIL(I,^[QUI]ANSA(X,1)) X ^%COMPIL(""A"",""ATTRIBUT"",1,1,^[QUI]ANSA(X,2)'=0)"
 
 s ^%COMPIL("A","ATTRIBUT",1,1,0)="D INSER(""S V(""_(I+1)_"")=1,V(""_(I+2)_"")=$$REPPCT^%TLOPTM(),V(""_(I+3)_"")=$$INDPCT^%TLOPTM()"")"
 
 s ^%COMPIL("A","ATTRIBUT",1,1,1)="D COMPIL(I+1,^[QUI]ANSA(X,2)) D INSER(""S V(""_(I+2)_"")=$$REPPCT^%TLOPTM(),V(""_(I+3)_"")=$$INDPCT^%TLOPTM()"")"
 
 s ^%COMPIL("A","VARIABLE",1)="D INSER(""S V(""_I_"")=""""""_^[QUI]ANSA(X,""TEXTE"")_"""""",V(""_(I+1)_"")=1,V(""_(I+2)_"")=$$REPPCT^%TLOPTM(),V(""_(I+3)_"")=$$INDPCT^%TLOPTM()"")"
 
 q
 ;

