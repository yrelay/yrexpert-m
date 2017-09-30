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

;%TLOUMK4^INT^1^59547,74030^0
%TLOUMK4 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 s ^%COMPIL("VERBL2",1)="S ZZZ(1)=0 F ZZZ=0:1 Q:'$D(^[QUI]ANSA(X,ZZZ+1))  X ^%COMPIL(""VERBL2"",1,$D(^%COMPIL(""PARAM"",$$TYPPAR(^[QUI]ANSA(X,""TEXTE""),ZZZ+1)))'=0)"
 s ^%COMPIL("VERBL2",1,0)="X ^%COMPIL(""PARAM"",""EXPR"",^[QUI]ANSA(X,ZZZ+1)'=0)"
 s ^%COMPIL("VERBL2",1,1)="X ^%COMPIL(""PARAM"",$$TYPPAR(^[QUI]ANSA(X,""TEXTE""),ZZZ+1),^[QUI]ANSA(X,ZZZ+1)'=0)"
 
 s ^%COMPIL("VERBL2",2)="I $D(^[QUI]ANSA(X,""PAR.TEXTE"")) X ^%COMPIL(""VERBL2"",2,^[QUI]ANSA(X,""PAR.TEXTE"")'=0)"
 s ^%COMPIL("VERBL2",2,1)="D COMPIL(I+ZZZ(1),^[QUI]ANSA(X,""PAR.TEXTE"")) S ZZZ(1)=ZZZ(1)+1"
 s ^%COMPIL("VERBL2",2,0)="D INSER(""S V(""_(I+ZZZ(1))_"")=$C(0)"") S ZZZ(1)=ZZZ(1)+1"
 
 
 s ^%COMPIL("VERBL2",3)="I $D(^[QUI]ANSA(X,""CONDITION"")) X ^%COMPIL(""VERBL2"",3,^[QUI]ANSA(X,""CONDITION"")'=0)"
 s ^%COMPIL("VERBL2",3,1)="D COMPIL(I+ZZZ(1),^[QUI]ANSA(X,""CONDITION"")) S ZZZ(1)=ZZZ(1)+1"
 s ^%COMPIL("VERBL2",3,0)="D INSER(""S V(""_(I+ZZZ(1))_"")=$C(0)"") S ZZZ(1)=ZZZ(1)+1"
 
 s ^%COMPIL("VERBL2",4)="I $D(^TOZE($J,""MESURE"")) I ^TOZE($J,""MESURE"") D INSER(""D DEB^%SGMESU(""""""_^[QUI]ANSA(X,""TEXTE"")_"""""")"")"
 
 s ^%COMPIL("VERBL2",5)="D INSER(""S V(""""V"""")=""""""_^[QUI]ANSA(X,""TEXTE"")_"""""",V(""""D"""")=""_I_"",V(""""N"""")=""_(ZZZ(1))_"""")"
 s ^%COMPIL("VERBL2",6)=""
 s ^%COMPIL("VERBL2",7)="D INSER(""S V(""_I_"")=""_$$ADROUT(^[QUI]ANSA(X,""TEXTE""))_""(""_I_"",""_(ZZZ(1))_"") K V(""""V"""")"")"
 s ^%COMPIL("VERBL2",8)="I $D(^TOZE($J,""MESURE"")) I ^TOZE($J,""MESURE"") D INSER(""D FIN^%SGMESU(""""""_^[QUI]ANSA(X,""TEXTE"")_"""""")"")"
 
 
 
 
 
 
 s ^%COMPIL("PARAM","EXPR",1)="D COMPIL(I+ZZZ(1),^[QUI]ANSA(X,ZZZ+1)) S ZZZ(1)=ZZZ(1)+1"
 s ^%COMPIL("PARAM","EXPR",0)="D INSER(""S V(""_(I+ZZZ(1))_"")=$C(0)"") S ZZZ(1)=ZZZ(1)+1"
 
 
 
 
 
 
 s ^%COMPIL("PARAM","STRING",1)="D COMPIL(I+ZZZ(1),^[QUI]ANSA(X,ZZZ+1)) S ZZZ(1)=ZZZ(1)+1"
 s ^%COMPIL("PARAM","STRING",0)="D INSER(""S V(""_(I+ZZZ(1))_"")="""""""""") S ZZZ(1)=ZZZ(1)+1"
 
 
 
 
 
 
 s ^%COMPIL("PARAM","REPERTOIRE",1)="D COMPIL(I+ZZZ(1),^[QUI]ANSA(X,ZZZ+1)) D INSER(""S V(""_(I+ZZZ(1))_"")=$$NOMINT^%QSF(V(""_(I+ZZZ(1))_""))""),INSER(""S:V(""_(I+ZZZ(1))_"")="""""""" DEROUT=999"") S ZZZ(1)=ZZZ(1)+1"
 s ^%COMPIL("PARAM","REPERTOIRE",0)="D INSER(""S V(""_(I+ZZZ(1))_"")=PARCO(""""REP"""")"") S ZZZ(1)=ZZZ(1)+1"
 
 
 
 
 
 s ^%COMPIL("PARAM","NOMIND",1)="D COMPIL(I+ZZZ(1),^[QUI]ANSA(X,ZZZ+1)) S ZZZ(1)=ZZZ(1)+1"
 s ^%COMPIL("PARAM","NOMIND",0)="D INSER(""S V(""_(I+ZZZ(1))_"")=PARCO(""""IND"""")"") S ZZZ(1)=ZZZ(1)+1"
 
 
 
 
 
 
 
 s ^%COMPIL("PARAM","INDIVIDU",1)="D COMPCHEM(I+ZZZ(1),^[QUI]ANSA(X,ZZZ+1)) S ZZZ(1)=ZZZ(1)+2"
 s ^%COMPIL("PARAM","INDIVIDU",0)="D INSER(""S V(""_(I+ZZZ(1))_"")=PARCO(""""REP""""),V(""_(I+ZZZ(1)+1)_"")=PARCO(""""IND"""")"") S ZZZ(1)=ZZZ(1)+2"
 
 
 
 s ^%COMPIL("PARAM","ENSEMBLE",1)="X ^%COMPIL(""PARAM"",""ENSEMBLE"",1,$D(^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),""TEXTE""))'=0) S ZZZ(1)=ZZZ(1)+3"
 s ^%COMPIL("PARAM","ENSEMBLE",1,0)="X ^%COMPIL(""PARAM"",""ENSEMBLE"",1,1,0)"
 s ^%COMPIL("PARAM","ENSEMBLE",1,1)="X ^%COMPIL(""PARAM"",""ENSEMBLE"",1,1,^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),""TEXTE"")=""$ENUM"")"
 
 s ^%COMPIL("PARAM","ENSEMBLE",1,1,0)="D COMPIL(I+ZZZ(1)+2,^[QUI]ANSA(X,ZZZ+1)) X ^%COMPIL(""PARAM"",""ENSEMBLE"",1,1,0,1) X ^%COMPIL(""PARAM"",""ENSEMBLE"",1,1,0,2)"
 s ^%COMPIL("PARAM","ENSEMBLE",1,1,0,1)="D INSER(""S V(""_(I+ZZZ(1)+1)_"")=$$NOMINT^%QSF(V(""_(I+ZZZ(1)+2)_"")) S:V(""_(I+ZZZ(1)+1)_"")'="""""""" V(""_(I+ZZZ(1))_"")=1"")"
 s ^%COMPIL("PARAM","ENSEMBLE",1,1,0,2)="D INSER(""S:V(""_(I+ZZZ(1)+1)_"")="""""""" V(""_(I+ZZZ(1)+1)_"")=V(""_(I+ZZZ(1)+2)_""),V(""_(I+ZZZ(1))_"")=2"")"
 
 
 
 s ^%COMPIL("PARAM","ENSEMBLE",1,1,1)="D INSER(""S V(""_(I+ZZZ(1))_"")=3,V(""_(I+ZZZ(1)+1)_"")=$$TEMP^%SGUTIL()"") X ^%COMPIL(""PARAM"",""ENSEMBLE"",1,1,2)"
 s ^%COMPIL("PARAM","ENSEMBLE",1,1,2)="F ZZZ(2)=1:1 Q:'$D(^[QUI]ANSA(^[QUI]ANSA(X,1+ZZZ),ZZZ(2)))  Q:^[QUI]ANSA(^[QUI]ANSA(X,1+ZZZ),ZZZ(2))=0  X ^%COMPIL(""PARAM"",""ENSEMBLE"",1,1,2,1)"
 s ^%COMPIL("PARAM","ENSEMBLE",1,1,2,1)="D COMPIL(I+ZZZ(1)+2,^[QUI]ANSA(^[QUI]ANSA(X,1+ZZZ),ZZZ(2))) D INSER(""S @V(""_(I+ZZZ(1)+1)_"")@(V(""_(I+ZZZ(1)+2)_""))="""""""""")"
 
 q

