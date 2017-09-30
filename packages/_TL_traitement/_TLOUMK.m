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

;%TLOUMK^INT^1^59547,74030^0
%TLOUMK ;;10:07 AM  4 Jun 1992; ; 07 Jun 93  4:42 PM
 
 
 
 
 k ^%COMPIL
 d ^%TLOUMK2,^%TLOUMK3,^%TLOUMK4,^%TLOUMK5,^%TLOUMK6,^%TLOUMK7,^%TLOUMK8,^%TLOUMK9,^%TLOUMKA
 
 
 
 
 
 
 
 s ^%COMPIL("C","INFERENCE",1)="X ^%COMPIL(""C"",""INFERENCE"",1,^[QUI]ANSA(X,1)'=0) D INSER(""S NATERR=3"") F ZZZ=2:1 Q:'$D(^[QUI]ANSA(X,ZZZ))  Q:^[QUI]ANSA(X,ZZZ)=0  D COMPIL(I,^[QUI]ANSA(X,ZZZ))"
 
 
 s ^%COMPIL("C","INFERENCE",1,0)=""
 
 s ^%COMPIL("C","INFERENCE",1,1)="D INSER(""S NATERR=1"") D COMPIL(I,^[QUI]ANSA(X,1)) D INSER(""S NATERR=2 S:'V(""_I_"") DEROUT=999"")"
 
 
 s ^%COMPIL("C","COMMENT",1)="D INSER("""")"
 
 s ^%COMPIL("C","OPERATEUR",1)="D COMPIL(I,^[QUI]ANSA(X,1)) D COMPIL(I+1,^[QUI]ANSA(X,2)) D INSER(""S V(""_I_"")=$$OPE^%TLOPTM(""""""_^[QUI]ANSA(X,""TEXTE"")_"""""",V(""_I_""),V(""_(I+1)_""))"")"
 
 s ^%COMPIL("C","OPERATEUR.LOGIQUE",1)="D COMPIL(I,^[QUI]ANSA(X,1)) D COMPIL(I+1,^[QUI]ANSA(X,2)) D INSER(""S V(""_I_"")=$$OPE^%TLOPTM(""""""_^[QUI]ANSA(X,""TEXTE"")_"""""",V(""_I_""),V(""_(I+1)_""))"")"
 
 s ^%COMPIL("C","COMPARATEUR.BINAIRE",1)="D COMPIL(I,^[QUI]ANSA(X,1)) D COMPIL(I+1,^[QUI]ANSA(X,2)) D INSER(""S V(""_I_"")=$$CMP^%TLOPTM(""""""_^[QUI]ANSA(X,""TEXTE"")_"""""",V(""_I_""),V(""_(I+1)_""))"")"
 
 s ^%COMPIL("C","COMPARATEUR.TERNAIRE",1)="D COMPIL(I,^[QUI]ANSA(X,1)),COMPIL(I+1,^[QUI]ANSA(X,2)),COMPIL(I+2,^[QUI]ANSA(X,3)) D INSER(""S V(""_I_"")=$$CMP3^%TLOPTM(""""""_^[QUI]ANSA(X,""TEXTE"")_"""""",V(""_I_""),V(""_(I+1)_""),V(""_(I+2)_""))"")"
 
 s ^%COMPIL("C","NOMBRE",1)="D INSER(""S V(""_I_"")=""_^[QUI]ANSA(X,""TEXTE""))"
 
 s ^%COMPIL("C","CHAINE",1)="D INSER(""S V(""_I_"")=""""""_^[QUI]ANSA(X,""TEXTE"")_"""""""")"
 s ^%COMPIL("C","NIMP",1)="D INSER(""S V(""_I_"")=""""""_^[QUI]ANSA(X,""TEXTE"")_"""""""")"
 
 
 s ^%COMPIL("C","ATTRIBUT",1)="X ^%COMPIL(""C"",""ATTRIBUT"",1,$E(^[QUI]ANSA(^[QUI]ANSA(X,1),""TEXTE""))=""%"")"
 
 s ^%COMPIL("C","ATTRIBUT",1,0)="D COMPIL(I,^[QUI]ANSA(X,1)) X ^%COMPIL(""C"",""ATTRIBUT"",1,0,^[QUI]ANSA(X,2)'=0,^[QUI]ANSA(X,3)'=0)"
 
 s ^%COMPIL("C","ATTRIBUT",1,0,0,0)="D INSER(""S:'$$AIR^%QSGE5(PARCO(""""REP""""),PARCO(""""IND""""),V(""_I_"")) DEROUT=999""),INSER(""S V(""_I_"")=$$GET2^%TLOPTM(PARCO(""""REP""""),PARCO(""""IND""""),V(""_I_""))"")"
 
 s ^%COMPIL("C","ATTRIBUT",1,0,0,1)="D COMPCHEM(I+1,^[QUI]ANSA(X,3)) D INSER(""S:'$$AIR^%QSGE5(V(""_(I+1)_""),V(""_(I+2)_""),V(""_I_"")) DEROUT=999""),INSER(""S V(""_I_"")=$$GET2^%TLOPTM(V(""_(I+1)_""),V(""_(I+2)_""),V(""_I_""))"")"
 
 s ^%COMPIL("C","ATTRIBUT",1,0,1,0)="D COMPIL(I+1,^[QUI]ANSA(X,2)) D INSER(""S:'$$OAIR^%QSGE5(PARCO(""""REP""""),PARCO(""""IND""""),V(""_I_""),V(""_(I+1)_"")) DEROUT=999""),INSER(""S V(""_I_"")=$$GET^%TLOPTM(PARCO(""""REP""""),PARCO(""""IND""""),V(""_I_""),V(""_(I+1)_""))"")"
 
 s ^%COMPIL("C","ATTRIBUT",1,0,1,1)="D COMPIL(I+1,^[QUI]ANSA(X,2)) D COMPCHEM(I+2,^[QUI]ANSA(X,3)) D INSER(""S:'$$OAIR^%QSGE5(V(""_(I+2)_""),V(""_(I+3)_""),V(""_I_""),V(""_(I+1)_"")) DEROUT=999""),INSER(""S V(""_I_"")=$$GET^%TLOPTM(V(""_(I+2)_""),V(""_(I+3)_""),V(""_I_""),V(""_(I+1)_""))"")"
 
 s ^%COMPIL("C","ATTRIBUT",1,1)="D COMPIL(I,^[QUI]ANSA(X,1)) X ^%COMPIL(""C"",""ATTRIBUT"",1,1,^[QUI]ANSA(X,2)'=0)"
 
 s ^%COMPIL("C","ATTRIBUT",1,1,0)="D INSER(""S:'$$AIR^%QSGE5($$REPPCT^%TLOPTM(),$$INDPCT^%TLOPTM(),V(""_I_"")) DEROUT=999""),INSER(""S V(""_I_"")=$$GET2^%TLOPTM($$REPPCT^%TLOPTM(),$$INDPCT^%TLOPTM(),V(""_I_""))"")"
 
 s ^%COMPIL("C","ATTRIBUT",1,1,1)="D COMPIL(I+1,^[QUI]ANSA(X,2)) D INSER(""S:'$$OAIR^%QSGE5($$REPPCT^%TLOPTM(),$$INDPCT^%TLOPTM(),V(""_I_""),V(""_(I+1)_"")) DEROUT=999""),INSER(""S V(""_I_"")=$$GET^%TLOPTM($$REPPCT^%TLOPTM(),$$INDPCT^%TLOPTM(),V(""_I_""),V(""_(I+1)_""))"")"
 
 
 s ^%COMPIL("C","VARIABLE",1)="D INSER(""S:'$$OAIR^%QSGE5($$REPPCT^%TLOPTM(),$$INDPCT^%TLOPTM(),""""""_^[QUI]ANSA(X,""TEXTE"")_"""""",1) DEROUT=999""),INSER(""S V(""_I_"")=$$GET^%TLOPTM($$REPPCT^%TLOPTM(),$$INDPCT^%TLOPTM(),""""""_^[QUI]ANSA(X,""TEXTE"")_"""""",1)"")"
 s ^%COMPIL("C","NOM",1)="D INSER(""S V(""_I_"")=""""""_^[QUI]ANSA(X,""TEXTE"")_"""""""")"
 s ^%COMPIL("C","ENTIER",1)="D INSER(""S V(""_I_"")=""_^[QUI]ANSA(X,""TEXTE""))"
 
 s ^%COMPIL("C","NEGATION",1)="D COMPIL(I,^[QUI]ANSA(X,1)) D INSER(""S V(""_I_"")='V(""_I_"")"")"
 s ^%COMPIL("C1","ACTION","AFFECTATION",1)="D COMPADR(I,^[QUI]ANSA(X,1)) D COMPIL(I+4,^[QUI]ANSA(X,2)) D INSER(""S V(""_I_"")=$$AFF^%TLOPTM(V(""_(I+2)_""),V(""_(I+3)_""),V(""_I_""),V(""_(I+1)_""),V(""_(I+4)_""))"")"
 
 q
 ;

