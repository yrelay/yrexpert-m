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

;%QS0CALC^INT^1^59547,73879^0
%QS0CALC ;;10:32 AM  10 Sep 1993; 06 Apr 93  8:08 PM ; 10 Sep 93 10:33 AM
 
 
 
 
 
 
REC(S,D) 
 N N,O,%O,O1,%O1,OKECR
 S OKECR=$$GET^%SGVAR("ECR")
 S N=0,O=-1
BOUCREC S O=$N(@S@(O)) G:O=-1 FINREC
 I ($D(@S@(O))#10)=0 S @D@(O)="",N=N=1 D:((N#10)=0)&OKECR AFFPT(N\10) G BOUCREC
 S O1=-1
BOUREC2 S O1=$N(@S@(O,O1))
 I O1=-1 S @D@(O)=@S@(O) G BOUCREC
 S @D@(O,O1)=@S@(O,O1),N=N+1
 I ((N#10)=0)&OKECR D AFFPT(N\10)
 G BOUREC2
FINREC Q N
 
AFFPT(N) S DY=20,DX=30+(N#45) X XY W ". " Q
 
INT(LL,LS) N A,I,N,NL,NLO,NT,O,%O,OKECR
 S OKECR=$$GET^%SGVAR("ECR")
 K @(LS) F I=1:1:$ZP(@LL@("")) S NL(@LL@(I,"CARD"),I)=""
 I '($D(NL)) Q 0
 S N=$N(NL(-1)),NLO=$N(NL(N,-1)),N=$$REC(@LL@(NLO,"ADRESSE"),LS)
 S I="" F %I=0:0 S I=$O(NL(I)) Q:I=""  S J=-1 F %J=0:0 S J=$N(NL(I,J)) Q:J=-1  I J'=NLO D TNLO
 Q N
TNLO 
 S NT=0,A=@LL@(J,"ADRESSE")
 S O=-1 F %O=0:0 S O=$N(@LS@(O)) Q:O=-1  S NT=NT+1 D:((NT#10)=0)&OKECR AFFPT(NT\10) I '($D(@A@(O))) S N=N-1 K @LS@(O)
 Q
 
INTERSECT(LL,LS) N A,I,%I,J,%J,N,NL,NT,O,%O,OKECR
 S OKECR=$$GET^%SGVAR("ECR")
 D DEL^%QS0(LS)
 D CREER(LS,"INTERSECTION",$$^%QSCALVA("L0",$N(@LL@(-1)),"BASE"))
 S I=-1 F %I=0:0 S I=$N(@LL@(I)) Q:I=-1  S NL($$^%QSCALVA("L0",I,"CARD"),I)=""
 S LL=$N(NL(-1)),LL=$N(NL(LL,-1)),N=$$RECOP(LL,LS)
 S I="" F %I=0:0 S I=$O(NL(I)) Q:I=""  S J=-1 F %J=0:0 S J=$N(NL(I,J)) Q:J=-1  I J'=LL W:OKECR "." S NT=0,A=$$^%QSCALVA("L0",J,"ADRESSE"),O=-1 F %O=0:0 S O=$N(^[QUI]ZLIGCALC(LS,O)) Q:O=-1  D TO1
 D ADDA^%QS0(LS,"CARD",N) Q
TO1 S NT=NT+1 D:((NT#100)=0)&OKECR AFFPT(NT\100) I '($D(@A@(O))) S N=N-1 K ^[QUI]ZLIGCALC(LS,O)
 Q
 
TSTUN(LL) 
 N %L,L,B,OK
 S L=$O(@LL@("")),B=$$^%QSCALVA("L0",L,"BASE"),OK=1
 F %L=0:0 S L=$O(@LL@(L)) Q:L=""  S OK=B=$$^%QSCALVA("L0",L,"BASE") Q:'(OK)
 I OK=1 Q ""
 Q $$^%QZCHW("Repertoires incompatibles")
 
UNION(LL,LS) 
 N A,I,%I,LT,N,NT,O,%O,OKECR
 S OKECR=$$GET^%SGVAR("ECR")
 D DEL^%QS0(LS) S LT=$N(@LL@(-1))
 D CREER(LS,"UNION",$$^%QSCALVA("L0",LT,"BASE"))
 S N=$$RECOP(LT,LS)
 S I=LT F %I=0:0 S I=$N(@LL@(I)) Q:I=-1  W:OKECR "." S NT=0,A=$$^%QSCALVA("L0",I,"ADRESSE"),O=-1 F %O=0:0 S O=$N(@A@(O)) Q:O=-1  D TOU
 D ADDA^%QS0(LS,"CARD",N) Q
TOU S NT=NT+1 D:((NT#100)=0)&OKECR AFFPT(NT\100) I '($D(^[QUI]ZLIGCALC(LS,O))) S N=N+1,^[QUI]ZLIGCALC(LS,O)=""
 Q
 
RECOP(LL,LS) 
 N A,N,O,%O,OKECR
 S OKECR=$$GET^%SGVAR("ECR")
 W:OKECR "." S N=0,A=$$^%QSCALVA("L0",LL,"ADRESSE"),O=-1 F %O=0:0 S O=$N(@A@(O)) Q:O=-1  S ^[QUI]ZLIGCALC(LS,O)="",N=N+1 D:((N#100)=0)&OKECR AFFPT(N\100)
 Q N
 
CREER(L,S,B) N I
 S I("SOURCE",1)=S,I("CARD",1)=0,I("BASE",1)=B,I("ADRESSE",1)="^[QUI]ZLIGCALC("""_L_""")"
 D ADD^%QS0(L,"I") Q
 
 
ERR S (STOPUC,REFUSE)=1 Q
OK S (STOPUC,REFUSE)=0 Q
SQ D ^%VSQUEAK G ERR
M D POCLEPA^%VVIDEO,^%VSQUEAK W M," ... [RETURN]" N BID R *BID D POCLEPA^%VVIDEO G ERR
NVIDE G:RESUL(IC)="" SQ G OK
LISTE I '($$IR^%QSGE5("L0",RESUL(IC))) N M S M="Liste inconnue" G M
INTER G:RESUL(IC)'="?" OK
 N LLL S LLL("REQUETES")="",LLL("INTERSECTION")="",LLL("UNION")=""
 D POCLEPA^%VVIDEO W "Un instant ..."
 S RESUL(IC)=$$CH^%QS0("LLL") N SIC,SICC S SIC=IC,SICC=ICC D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR,@("CAD^"_NOMPROG) S IC=SICC,ICC=SICC G:RESUL(IC)="" SQ G OK
MEMBA I $$^%QSCALVA("L0",RESUL(1),"BASE")'=$$^%QSCALVA("L0",RESUL(2),"BASE") S M="Veuillez choisir des listes contenant le meme type d'individus" G M
 G OK
 
 
 
 
 
UNIETU(ENSLS,LRES) 
 N LS,OK,%LS,BA,BA2,IND,%I
 S LS=$O(@ENSLS@(""))
 Q:LS=""
 S BA=$$^%QSCALIN("L0",LS,"BASE",1),OK=1
 F %LS=0:0 S LS=$O(@ENSLS@(LS)) Q:LS=""  S BA2=$$^%QSCALIN("L0",LS,"BASE",1) I BA'=BA2 S OK=0 Q
 Q:'(OK)
 D CREERL^%QS0XG1(LRES,BA,"^[QUI]ZLIGCALC("""_LRES_""")","UNION","UNION")
 S LS="" F %LS=0:0 S LS=$O(@ENSLS@(LS)) Q:LS=""  S IND="" F %I=0:0 S IND=$$SUIVL^%QS0XG1(LS,IND) Q:IND=""  I '($$INLIS^%QS0XG2(LRES,IND)) D AJOUT^%QS0XG1(LRES,IND) W "AJOUT de "_IND
 Q
 
INTETU(ENSLS,LRES) 
 N LS,OK,%LS,BA,BA2,IND,%I,TEMP,LMI,C
 S TEMP=$$TEMP^%SGUTIL
 S LS=$O(@ENSLS@("")) Q:LS=""
 S BA=$$^%QSCALIN("L0",LS,"BASE",1),OK=1
 F %LS=0:0 S LS=$O(@ENSLS@(LS)) Q:LS=""  S BA2=$$^%QSCALIN("L0",LS,"BASE",1),@TEMP@("C",$$^%QSCALIN("L0",LS,"CARD",1))=LS I BA'=BA2 S OK=0 Q
 Q:'(OK)
 D CREERL^%QS0XG1(LRES,BA,"^[QUI]ZLIGCALC("""_LRES_""")","INTERSECTION","INTERSECTION")
 S C=$O(@TEMP@("C",C)),LMI=@TEMP@("C",C)
NXIINT S IND=""
 S IND=$$SUIVL^%QS0XG1(LMI,IND) Q:IND=""
 S LS="" F %LS=0:0 S LS=$O(@ENSLS@(LS)) Q:LS=""  I LS'=LMI,'($$INLIS^%QS0XG2(LS,IND)) S OKI=0 Q
 D:OKI AJOUT^%QS0XG1(LRES,IND)
 G NXIINT
 ;
 ;
 ;

