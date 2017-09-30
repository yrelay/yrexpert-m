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

;%TLOUMK3^INT^1^59547,74030^0
%TLOUMK3 ;;04:15 PM  24 Jul 1992; ; 07 Jun 93  4:42 PM
 
 
 
 
 
 
 
 
 
 
 
 s ^%COMPIL("H","NOM",1)="X ^%COMPIL(""H"",""NOM"",1,$E(^[QUI]ANSA(X,""TEXTE""))=""%"")"
 
 s ^%COMPIL("H","NOM",1,0)="D INSER(""D GETILIE^%TLOPTM(PARCO(""""REP""""),PARCO(""""IND""""),""""""_^[QUI]ANSA(X,""TEXTE"")_"""""",.%TP1,.%TP2) S V(""_(I)_"")=%TP1,V(""_(I+1)_"")=%TP2"")"
 
 s ^%COMPIL("H","NOM",1,1)="D INSER(""S:'$$EXIIPCT^%TLOPTM(""""""_^[QUI]ANSA(X,""TEXTE"")_"""""") DEROUT=999""),INSER(""D GETIPCT^%TLOPTM(""""""_^[QUI]ANSA(X,""TEXTE"")_"""""",.%TP1,.%TP2) S V(""_(I)_"")=%TP1,V(""_(I+1)_"")=%TP2"")"
 
 
 s ^%COMPIL("H","ATTRIBUT",1)="X ^%COMPIL(""H"",""ATTRIBUT"",1,$E(^[QUI]ANSA(^[QUI]ANSA(X,1),""TEXTE""))=""%"")"
 
 s ^%COMPIL("H","ATTRIBUT",1,0)="D COMPIL(I,^[QUI]ANSA(X,1)) X ^%COMPIL(""H"",""ATTRIBUT"",1,0,^[QUI]ANSA(X,2)'=0)"
 
 s ^%COMPIL("H","ATTRIBUT",1,0,0)="D INSER(""D GETILIE^%TLOPTM(PARCO(""""REP""""),PARCO(""""IND""""),V(""_I_""),.%TP1,.%TP2) S V(""_(I)_"")=%TP1,V(""_(I+1)_"")=%TP2"")"
 
 s ^%COMPIL("H","ATTRIBUT",1,0,1)="D COMPIL(I+1,^[QUI]ANSA(X,2)) D INSER(""D GETILIE2^%TLOPTM(PARCO(""""REP""""),PARCO(""""IND""""),V(""_I_""),V(""_(I+1)_"").%TP1,.%TP2) S V(""_(I)_"")=%TP1,V(""_(I+1)_"")=%TP2"")"
 
 s ^%COMPIL("H","ATTRIBUT",1,1)="D COMPIL(I,^[QUI]ANSA(X,1)) D INSER(""S:'$$EXIIPCT^%TLOPTM(V(""_I_"")) DEROUT=999""),INSER(""D GETIPCT^%TLOPTM(V(""_I_""),.%TP1,.%TP2) S V(""_(I)_"")=%TP1,V(""_(I+1)_"")=%TP2"")"
 
 s ^%COMPIL("H","VARIABLE",1)="D INSER(""S V(""_I_"")=""""""_^[QUI]ANSA(X,""TEXTE"")_"""""""") D INSER(""S:'$$EXIIPCT^%TLOPTM(V(""_I_"")) DEROUT=999""),INSER(""D GETIPCT^%TLOPTM(V(""_I_""),.%TP1,.%TP2) S V(""_(I)_"")=%TP1,V(""_(I+1)_"")=%TP2"")"
 
 s ^%COMPIL("H","CHAINE",1)="D INSER(""S V(""_I_"")=PARCO(""""REP""""),V(""_(I+1)_"")=PARCO(""""IND"""")"")"
 
 s ^%COMPIL("H","IDF",1)="D INSER(""S V(""_I_"")=""""""_^[QUI]ANSA(X,""TEXTE"")_"""""""") D INSER(""S:'$$EXIIPCT^%TLOPTM(V(""_I_"")) DEROUT=999""),INSER(""D GETIPCT^%TLOPTM(V(""_I_""),.%TP1,.%TP2) S V(""_(I)_"")=%TP1,V(""_(I+1)_"")=%TP2"")"
 q

