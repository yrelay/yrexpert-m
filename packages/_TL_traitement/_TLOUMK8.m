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

;%TLOUMK8^INT^1^59547,74030^0
%TLOUMK8 ;;05:24 PM  20 May 1992; ; 07 Jun 93  4:43 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 s ^%COMPIL("PARAM","ATT",1)="D COMPADR(I+ZZZ(1),^[QUI]ANSA(X,ZZZ+1)) X ^%COMPIL(""PARAM"",""ATT"",1,1) S ZZZ(1)=ZZZ(1)+5"
 s ^%COMPIL("PARAM","ATT",1,1)="D INSER(""S V(""_(I+ZZZ(1)+4)_"")=$S($$OAIR^%QSGE5(V(""_(I+ZZZ(1)+2)_""),V(""_(I+ZZZ(1)+3)_""),V(""_(I+ZZZ(1))_""),V(""_(I+ZZZ(1)+1)_"")):$$GET^%TLOPTM(V(""_(I+ZZZ(1)+2)_""),V(""_(I+ZZZ(1)+3)_""),V(""_(I+ZZZ(1))_""),V(""_(I+ZZZ(1)+1)_"")),1:$C(0))"")"
 s ^%COMPIL("PARAM","ATT",0)="D INSER(""S V(""_(I+ZZZ(1))_"")=$C(0),V(""_(I+ZZZ(1)+1)_"")=$C(0),V(""_(I+ZZZ(1)+2)_"")=$C(0),V(""_(I+ZZZ(1)+3)_"")=$C(0),V(""_(I+ZZZ(1)+4)_"")=$C(0)"") S ZZZ(1)=ZZZ(1)+5"
 
 
 
 
 
 
 
 
 
 
 
 s ^%COMPIL("PARAM","ATTRIBUT",1)="D COMPADR(I+ZZZ(1)+1,^[QUI]ANSA(X,ZZZ+1)) D INSER(""S V(""_(I+ZZZ(1))_"")=$S(V(""_(I+ZZZ(1)+3)_"")=$$REPPCT^%TLOPTM():1,1:0)"") D:^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),2)=0 INSER(""S V(""_(I+ZZZ(1)+2)_"")=$C(0)"") S ZZZ(1)=ZZZ(1)+5"
 
 
 
 
 s ^%COMPIL("PARAM","POURCENT",1)="D COMPADR(I+ZZZ(1),^[QUI]ANSA(X,ZZZ+1)) S ZZZ(1)=ZZZ(1)+1"
 
 
 
 
 
 s ^%COMPIL("PARAM","ATTTRI",0)="D INSER(""S V(""_(I+ZZZ(1))_"")=$C(0)"")"
 s ^%COMPIL("PARAM","ATTTRI",1)="D COMPIL(I+ZZZ(1),^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),1)) X ^%COMPIL(""PARAM"",""ATTTRI"",2,^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),2)'=0) X ^%COMPIL(""PARAM"",""ATTTRI"",3,^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),3)'=0) S ZZZ(1)=ZZZ(1)+3"
 s ^%COMPIL("PARAM","ATTTRI",2,0)="D INSER(""S V(""_(I+ZZZ(1)+1)_"")=1"")"
 s ^%COMPIL("PARAM","ATTTRI",2,1)="D COMPIL(I+ZZZ(1)+1,^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),2))"
 s ^%COMPIL("PARAM","ATTTRI",3,0)="D INSER(""S V(""_(I+ZZZ(1)+2)_"")="""""""""")"
 s ^%COMPIL("PARAM","ATTTRI",3,1)="D COMPIL(I+ZZZ(1)+2,^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),3))"
 
 
 s ^%COMPIL("PARAM","QUELCONQUE",1)="X ^%COMPIL(""PARAM"",""QUELCONQUE"",1,(^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),""TYPE"")=""ATTRIBUT"")!(^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),""TYPE"")=""VARIABLE"")) S ZZZ(1)=ZZZ(1)+5"
 s ^%COMPIL("PARAM","QUELCONQUE",1,1)="D COMPADR(I+ZZZ(1),^[QUI]ANSA(X,ZZZ+1)) D INSER(""S V(""_(I+ZZZ(1)+4)_"")=$C(0)"") X ^%COMPIL(""PARAM"",""QUELCONQUE"",1,1,1)"
 s ^%COMPIL("PARAM","QUELCONQUE",1,1,1)="D INSER(""S:$$OAIR^%QSGE5(V(""_(I+ZZZ(1)+2)_""),V(""_(I+ZZZ(1)+3)_""),V(""_(I+ZZZ(1))_""),V(""_(I+ZZZ(1)+1)_"")) V(""_(I+ZZZ(1)+4)_"")=$$GET^%TLOPTM(V(""_(I+ZZZ(1)+2)_""),V(""_(I+ZZZ(1)+3)_""),V(""_(I+ZZZ(1))_""),V(""_(I+ZZZ(1)+1)_""))"")"
 s ^%COMPIL("PARAM","QUELCONQUE",1,0)="D INSER(""S (V(""_(I+ZZZ(1))_""),V(""_(I+ZZZ(1)+1)_""),V(""_(I+ZZZ(1)+2)_""),V(""_(I+ZZZ(1)+3)_""))=$C(0)"") D COMPIL(I+ZZZ(1)+4,^[QUI]ANSA(X,ZZZ+1))"
 
 q
 ;

