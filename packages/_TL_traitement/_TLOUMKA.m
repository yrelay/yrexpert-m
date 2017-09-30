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

;%TLOUMKA^INT^1^59547,74030^0
%TLOUMKA ;;11:04 AM  5 Nov 1992; ; 07 Jun 93  4:44 PM
 
 
 
 
 
 s ^%COMPIL("PARAM","LISTE.VAL",0)="D INSER(""S V(""_(I+ZZZ(1))_"")=$C(0)"") S ZZZ(1)=ZZZ(1)+1"
 s ^%COMPIL("PARAM","LISTE.VAL",1)="X ^%COMPIL(""PARAM"",""LISTE.VAL"",1,$D(^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),""TEXTE""))'=0) S ZZZ(1)=ZZZ(1)+1"
 s ^%COMPIL("PARAM","LISTE.VAL",1,0)="X ^%COMPIL(""PARAM"",""LISTE.VAL"",1,1,0)"
 s ^%COMPIL("PARAM","LISTE.VAL",1,1)="X ^%COMPIL(""PARAM"",""LISTE.VAL"",1,1,^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),""TEXTE"")=""$LISTE"")"
 
 s ^%COMPIL("PARAM","LISTE.VAL",1,1,0)="D INSER(""S V(""_(I+ZZZ(1))_"")=$C(0)"")"
 
 
 s ^%COMPIL("PARAM","LISTE.VAL",1,1,1)="D INSER(""S V(""_(I+ZZZ(1))_"")=$$TEMP^%SGUTIL()"") F ZZZ(2)=1:1 Q:'$D(^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),ZZZ(2)))  Q:^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),ZZZ(2))=0  X ^%COMPIL(""PARAM"",""LISTE.VAL"",1,1,1,1)"
 s ^%COMPIL("PARAM","LISTE.VAL",1,1,1,1)="D COMPIL(I+ZZZ(1)+1,^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),ZZZ(2))) D INSER(""S @V(""_(I+ZZZ(1))_"")@(""_ZZZ(2)_"")=V(""_(I+ZZZ(1)+1)_"")"")"
 
 
 
 
 
 s ^%COMPIL("PARAM","LISTE.ADR",0)="D INSER(""S V(""_(I+ZZZ(1))_"")=$C(0)"") S ZZZ(1)=ZZZ(1)+1"
 s ^%COMPIL("PARAM","LISTE.ADR",1)="X ^%COMPIL(""PARAM"",""LISTE.ADR"",1,$D(^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),""TEXTE""))'=0) S ZZZ(1)=ZZZ(1)+1"
 s ^%COMPIL("PARAM","LISTE.ADR",1,0)="X ^%COMPIL(""PARAM"",""LISTE.ADR"",1,1,0)"
 s ^%COMPIL("PARAM","LISTE.ADR",1,1)="X ^%COMPIL(""PARAM"",""LISTE.ADR"",1,1,^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),""TEXTE"")=""$LISTE"")"
 
 s ^%COMPIL("PARAM","LISTE.ADR",1,1,0)="D INSER(""S V(""_(I+ZZZ(1))_"")=$C(0)"")"
 
 s ^%COMPIL("PARAM","LISTE.ADR",1,1,1)="D INSER(""S V(""_(I+ZZZ(1))_"")=$$TEMP^%SGUTIL()"") F ZZZ(2)=1:1 Q:'$D(^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),ZZZ(2)))  Q:^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),ZZZ(2))=0  X ^%COMPIL(""PARAM"",""LISTE.ADR"",1,1,1,1),^%COMPIL(""PARAM"",""LISTE.ADR"",1,1,1,2)"
 s ^%COMPIL("PARAM","LISTE.ADR",1,1,1,1)="D COMPADR(I+ZZZ(1)+1,^[QUI]ANSA(^[QUI]ANSA(X,ZZZ+1),ZZZ(2))) D INSER(""S @V(""_(I+ZZZ(1))_"")@(""_ZZZ(2)_"",""""A"""")=V(""_(I+ZZZ(1)+1)_"")"")"
 s ^%COMPIL("PARAM","LISTE.ADR",1,1,1,2)="D INSER(""S @V(""_(I+ZZZ(1))_"")@(""_ZZZ(2)_"",""""O"""")=V(""_(I+ZZZ(1)+2)_""),@V(""_(I+ZZZ(1))_"")@(""_ZZZ(2)_"",""""R"""")=V(""_(I+ZZZ(1)+3)_""),@V(""_(I+ZZZ(1))_"")@(""_ZZZ(2)_"",""""I"""")=V(""_(I+ZZZ(1)+4)_"")"")"
 q
 ;

