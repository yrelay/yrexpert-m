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

;%QNEQUI1^INT^1^59547,73879^0
QNEQUI1 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
VER(LIND,INSEPL,INCOMP,INS,INC,INCOMPL,MSG) 
 N ER,I,TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),""),MSG=""
 K @(TEMP)
 
 I '($$ISPARTO(INSEPL,INS)) S MSG=$$^%QZCHW("les intersections deux a deux des listes d'inseparables ne sont pas vides") D FIN Q
 
 D INCOMP(INCOMP,INC)
 
 
 D PLUSINC(INS,INSEPL,INC,INCOMPL)
 
 
 
 D INTERP(INSEPL,INCOMPL,.ER)
 I ER=1 S MSG=$$^%QZCHW("il existe des inseparables incompatibles") D FIN Q
 Q
FIN K @(TEMP) Q
 
 
INTERP(INSEPL,INCOMPL,ER) 
 N I,L
 S ER=0
 S L=$O(@INSEPL@(""))
 F I=0:0 Q:L=""  Q:ER=1  D INTERP1 S L=$O(@INSEPL@(L))
 Q
INTERP1 
 S ER=$$INTER0(@INSEPL@(L),$$CONCAT^%QZCHAD(INCOMPL,"""L"""))
 Q
 
INTER0(A,B) 
 
 N I,Y,X,VIDE
 S VIDE=0
 S X=$O(@A@("")),Y=$O(@B@(""))
 F I=0:0 Q:VIDE  Q:(X="")!(Y="")  D INTER1
 Q VIDE
INTER1 I X=Y S VIDE=1,X=$O(@A@(X)),Y=$O(@B@(Y)) Q
 I X]Y S Y=$S($D(@B@(X)):X,1:$O(@B@(X))) Q
 I Y]X S X=$S($D(@A@(Y)):Y,1:$O(@A@(Y))) Q
 Q
 
 
PLUSINC(INS,INSEPL,INC,INCOMPL) 
 N I,L,X,DEJAVUL,TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"PLUSINC")
 S DEJAVUL=$$CONCAS^%QZCHAD(TEMP,"DEJAVUL")
 K @(TEMP)
 S L=$O(@INSEPL@(""))
 F I=0:0 Q:L=""  D PLUSINC1(INS,INSEPL,L,INCOMPL) S L=$O(@INSEPL@(L))
 
 S X=$O(@INC@(""))
 F I=0:0 Q:X=""  D:'($D(@INS@(X))) PLUSX(X,INS,INSEPL,INC,DEJAVUL) S X=$O(@INC@(X))
 K @(TEMP)
 Q
 
PLUSINC1(INS,INSEPL,L,UNION) 
 N O,I,ADRL
 S ADRL=@INSEPL@(L)
 S O=$O(@ADRL@(""))
 F I=0:0 Q:O=""  D PLUSINC2 S O=$O(@ADRL@(O))
 Q
 
PLUSINC2 
 N I,A
 S A=$O(@INC@(O,""))
 F I=0:0 Q:A=""  D PLUSINC3 S A=$O(@INC@(O,A))
 Q
PLUSINC3 
 I '($D(@INS@(A))) S @UNION@(L,A)="" Q
 N ADR,I,B,L1
 
 S L1=@INS@(A)
 
 S ADR=@INSEPL@(L1)
 S B=$O(@ADR@(""))
 F I=0:0 Q:B=""  S @UNION@(L,B)="",B=$O(@ADR@(B))
 Q
 
PLUSX(X,INS,INSEPL,INC,DEJAVUL) 
 N Y,I
 S Y=$O(@INC@(X,""))
 F I=0:0 Q:Y=""  D:$D(@INS@(Y)) PLUSX1 S Y=$O(@INC@(X,Y))
 Q
 
PLUSX1 N L,A,I,ADR
 S L=@INS@(Y)
 I $D(@DEJAVUL@(L)) Q
 S @DEJAVUL@(L)=""
 S ADR=@INSEPL@(L)
 S A=$O(@ADR@(""))
 F I=0:0 Q:A=""  S @INC@(X,A)="",A=$O(@ADR@(A))
 Q
 
INCOMP(INCOMP,INC) 
 N ADRL,L,I,J,X,Y
 S L=""
 F I=0:0 S L=$O(@INCOMP@(L)) Q:L=""  D INCOMP1
 Q
INCOMP1 
 S X="",ADRL=@INCOMP@(L)
 F I=0:0 S X=$O(@ADRL@(X)) Q:X=""  D INC
 Q
INC 
 S Y=""
 I '($D(@INC@(X))) S @INC@(X)=L
 F J=0:0 S Y=$O(@ADRL@(Y)) Q:Y=""  I X'=Y S @INC@(X,Y)=""
 Q
 
 
 
 
 
 
 
 
ISPARTO(LLISTE,LOC) 
 N I,L,O,ADRL,TEMP,VIDE
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ISPARTO")
 K @(TEMP)
 S VIDE=1,L=""
 F I=0:0 S L=$O(@LLISTE@(L)) Q:L=""  Q:VIDE=0  D ISP1
 K @(TEMP)
 Q VIDE
ISP1 S ADRL=@LLISTE@(L)
 S O=$O(@ADRL@(""))
 F I=0:0 Q:O=""  Q:VIDE=0  D ISP2 S O=$O(@ADRL@(O))
 Q
ISP2 
 I $D(@LOC@(O)) S VIDE=0 Q
 S @LOC@(O)=L
 Q

