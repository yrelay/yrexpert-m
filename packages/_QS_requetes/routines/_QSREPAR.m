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

;%QSREPAR^INT^1^59547,73883^0
%QSREPAR ;
 
 
 
 
 
 
TOUTQRY D ENTETE("T") Q
 
BASEQRY D ENTETE("B") Q
 
ENTETE(PRE) 
 N I,X,%U,TABC
 W !,$$^%QZCHW("Vous avez actuellement 1 seule table QUERYi")
 W !,"V/ QUERYV"
 W !,"2/ QUERY2"
 W !,"3/ QUERY3"
 W !,"4/ QUERY4",!,!
L0 F %U=2:1:4 S TABC(%U)="QUERY"_%U
 S TABC("V")="QUERYV"
 S X=$$MES^%VZECHO($$^%QZCHW("Laquelle est-ce ?"),"TABC") F I=1,6,"QUERYV","QUERY2","QUERY3","QUERY4" G:(X=I)&((X=1)!(X=6)) @I G:(I=X)&(PRE="T") @(PRE_I) G:(I=X)&(PRE="B") LIREBASE
 
 
TQUERYV D REPARV,CARDM,^%QMTRAQS Q
TQUERY2 D REPAR2,CARDM,^%QMTRAQS Q
TQUERY3 D REPAR3,CARDM,^%QMTRAQS Q
TQUERY4 D REPAR4,CARDM,^%QMTRAQS Q
 
 
LIREBASE 
 S %R="%",II="^[QUI]"_I F %V=1:1 S %R=$O(@II@(%R)) Q:%R=""  S TABR(%V)=%R
 W !,!,!,$$^%QZCHW("Vous avez les repertoires (NOM INTERNE) suivants : ")
 F %J=1:2:%V-1 I $D(TABR(%J+1)) W !,%J," / ",TABR(%J),?30,%J+1," / ",TABR(%J+1)
 I $D(TABR(%J)) W !,%J," / ",TABR(%J)
 W !,$$^%QZCHW("Quel Repertoire (Nom interne ou numero) ? ") R %REP
 I (%REP=%REP)+0 S %REP=TABR(%REP)
 F %K=1:1:%V-1 S REPVER=TABR(%K) G:REPVER=%REP @(PRE_I)
 D ^%VSQUEAK G L0
 
BQUERYV N N S N=0 D REPARV1(%REP),CARD(%REP)
BQUERY2 N N S N=0 D REPAR21(%REP),CARD(%REP)
BQUERY3 N N S N=0 D REPAR31(%REP),CARD(%REP)
BQUERY4 N N S N=0 D REPAR41(%REP),CARD(%REP) Q
 
 
1 Q
6 Q
 
 
REPARV N C1,%C1,C2,%C2,C3,%C3,C4,%C4,C5,N
 S N=0
 S C1="" F %C1=0:0 S C1=$O(^[QUI]QUERYV(C1)) Q:C1=""  D REPARV1(C1)
 Q
REPARV1(C1) 
 S C2="" F %C2=0:0 S C2=$O(^[QUI]QUERYV(C1,C2)) Q:C2=""  S C3="" F %C3=0:0 S C3=$O(^[QUI]QUERYV(C1,C2,C3)) Q:C3=""  S C4="" F %C4=0:0 S C4=$O(^[QUI]QUERYV(C1,C2,C3,C4)) Q:C4=""  D T1
 Q
T1 S N=N+1 W:(N#100)=0 "%"
 S C5="",C5=^[QUI]QUERYV(C1,C2,C3,C4) Q:C5=""  S ^[QUI]QUERY2(C1,C3,C5,C4,C2)="",^[QUI]QUERY3(C1,C2,C4,C3,C5)="",^[QUI]QUERY4(C1,C5,C3,C4,C2)=""
 Q
 
 
REPAR2 N C1,%C1,C2,%C2,C3,%C3,C4,%C4,C5,%C5,N
 S N=0
 S C1="" F %C1=0:0 S C1=$O(^[QUI]QUERY2(C1)) Q:C1=""  D REPAR21(C1)
 Q
REPAR21(C1) 
 S C2="" F %C2=0:0 S C2=$O(^[QUI]QUERY2(C1,C2)) Q:C2=""  S C3="" F %C3=0:0 S C3=$O(^[QUI]QUERY2(C1,C2,C3)) Q:C3=""  S C4="" F %C4=0:0 S C4=$O(^[QUI]QUERY2(C1,C2,C3,C4)) Q:C4=""  D T2
 Q
T2 S N=N+1 W:(N#100)=0 "%"
 S C5="" F %C5=0:0 S C5=$O(^[QUI]QUERY2(C1,C2,C3,C4,C5)) Q:C5=""  S ^[QUI]QUERYV(C1,C5,C2,C4)=C3,^[QUI]QUERY3(C1,C5,C4,C2,C3)="",^[QUI]QUERY4(C1,C3,C2,C4,C5)=""
 Q
 
 
REPAR3 N C1,%C1,C2,%C2,C3,%C3,C4,%C4,C5,%C5,N
 S N=0
 S C1="" F %C1=0:0 S C1=$O(^[QUI]QUERY3(C1)) Q:C1=""  D REPAR31(C1)
 Q
REPAR31(C1) 
 S C2="" F %C2=0:0 S C2=$O(^[QUI]QUERY3(C1,C2)) Q:C2=""  S C3="" F %C3=0:0 S C3=$O(^[QUI]QUERY3(C1,C2,C3)) Q:C3=""  S C4="" F %C4=0:0 S C4=$O(^[QUI]QUERY3(C1,C2,C3,C4)) Q:C4=""  D T3
 Q
T3 S N=N+1 W:(N#100)=0 "%"
 S C5="" F %C5=0:0 S C5=$O(^[QUI]QUERY3(C1,C2,C3,C4,C5)) Q:C5=""  S ^[QUI]QUERYV(C1,C2,C4,C3)=C5,^[QUI]QUERY2(C1,C4,C5,C3,C2)="",^[QUI]QUERY4(C1,C5,C4,C3,C2)=""
 Q
 
 
REPAR4 N C1,%C1,C2,%C2,C3,%C3,C4,%C4,C5,%C5,N
 S N=0
 S C1="" F %C1=0:0 S C1=$O(^[QUI]QUERY4(C1)) Q:C1=""  D REPAR41(C1)
 Q
REPAR41(C1) 
 S C2="" F %C2=0:0 S C2=$O(^[QUI]QUERY4(C1,C2)) Q:C2=""  S C3="" F %C3=0:0 S C3=$O(^[QUI]QUERY4(C1,C2,C3)) Q:C3=""  S C4="" F %C4=0:0 S C4=$O(^[QUI]QUERY4(C1,C2,C3,C4)) Q:C4=""  D T4
 Q
T4 S N=N+1 W:(N#100)=0 "%"
 S C5="" F %C5=0:0 S C5=$O(^[QUI]QUERY4(C1,C2,C3,C4,C5)) Q:C5=""  S ^[QUI]QUERYV(C1,C5,C3,C4)=C2,^[QUI]QUERY2(C1,C3,C2,C4,C5)="",^[QUI]QUERY3(C1,C5,C4,C3,C2)=""
 Q
 
 
 
 
CARD(R) N INDIV,I
 I $$REPM^%QSGEST9($$NOMLOG^%QSF(R))=0 Q
 I $$REP^%QSGEST5(R)=0 S ^[QUI]QUERYV(R)=0 Q
 S INDIV=$O(^[QUI]QUERYV(R,""))
 F I=0:1 Q:INDIV=""  S INDIV=$O(^[QUI]QUERYV(R,INDIV))
 S ^[QUI]QUERYV(R)=I
 W !,"repertoire ",R,?30,"card : ",^[QUI]QUERYV(R)
 Q
CARDM N R,GL,I
 S GL="GL"
 Q:$$MODEL^%QSMODEL=""
 D REP^%QSGEST9(GL)
 S R=$O(GL(""))
 F I=0:0 Q:R=""  D CARD($$NOMINT^%QSF(R)) S R=$O(GL(R))
 Q

