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

;%QWSTOI^INT^1^59547,73886^0
%QWSTOI ;
 
 
 
 
AJOUTER(MODE,R,I,TYPR,NR,NEUE) 
 Q:$D(@WWSTOCK@(R,I))
 
 I $$IR^%QSGEST5(R,I) G O1
 
 I MODE="EXEC" S:$$AFFECT^%QWSTOE(TYPR,NR,@NEUE,R,I,"NOM",1,I) @NEUE=0 Q
 D AFF(MODE,R,I,"NOM",1,I) Q
 
 
O1 N %AL,%OL,%VL,A,AL,GL,ID,O,O2,OL,LI,LIX,LX,RD,RL,T,V,VL
 S RL=$$ONE^%QSGEL3("LIEN"),A=""
O14 S A=$$NXTRIA^%QSTRUC8(R,I,A) Q:A=""
 I ($E(A,1,8)="INVERSE.")!($E(A,1,5)="LIEN.") G O14
 S O=""
O15 S O=$$NXTRIAO^%QSTRUC8(R,I,A,O) G:O="" O14
 S V=$$VALEUR^%QSTRUC8(R,I,A,O)
 S T=$$TYPE^%QSGEST9(R,A)
 
 I T=0 D AFF(MODE,R,I,A,O,V) G O15
 
 
 
 S RD=@WWLSTOCK@(A,"D")
 
 S ID=$$NOM^%QSGES21(R,I,A,O)
 
 G:'($$EXIRI^%QWSTOL(RD,ID)) O15
 S LI=@WWLSTOCK@(A,"I")
 
 S LX=$$NOML1^%QSGES20(I,O,A,ID)
 S O2=$$OR^%QSCALVA(RD,ID,LI,$S(T=1:$$NOMEX^%QSGES10(R,I),1:I)),LIX=$$NOML1^%QSGES20(ID,O2,LI,I)
 D AFF(MODE,R,I,A,O,V)
 
 S AL="" F %AL=0:0 S AL=$$NXTRIA^%QSTRU8(RL,LX,AL) Q:AL=""  S OL="" F %OL=0:0 S OL=$$NXTRIAO^%QSTRUC8(RL,LX,OL) Q:OL=""  S VL=$$VALEUR^%QSTRUC8(RL,LX,AL,OL,VL) D AFF(MODE,RL,LX,AL,OL,VL)
 
 S AL="" F %AL=0:0 S AL=$$NXTRIA^%QSTRU8(RL,LIX,AL) Q:AL=""  S OL="" F %OL=0:0 S OL=$$NXTRIAO^%QSTRUC8(RL,LIX,OL) Q:OL=""  S VL=$$VALEUR^%QSTRUC8(RL,LIX,AL,OL,VL) D AFF(MODE,RL,LX,AL,OL,VL)
 D AFF(MODE,RD,ID,LI,O2,$S(T=1:$$NOMEX^%QSGES10(R,I),1:I))
 
 S @WWLSTOCK@(LI,"F",ID,O2,I)=LIX
 S @WWLSTOCK@(A,"F",I,O,ID)=LX
 G O15
 
OKLINK(REP,IND,LIEN,ORD,DEST,O2) 
 N LINV
 S LINV=@WWLSTOCK@(LIEN,"I")
 I $D(@WWLSTOCK@(LIEN,"F",IND,ORD))=10 Q:'($D(@WWLSTOCK@(LIEN,"F",IND,ORD,DEST))) 0
 I $D(@WWLSTOCK@(LINV,"F",DEST,O2))=10 Q $D(@WWLSTOCK@(LINV,"F",DEST,O2,IND))
 Q 1
 
 
 
 
 
LINK(MODE,REP,IND,LIEN,ORD,DEST,O2,TYPR,NR,NEUE) 
 N NUML,AFF,MODI,RDEST,RL
 S RL=$$ONE^%QSGEL3("LIEN")
 
 I $D(@WWLSTOCK@(LIEN,"F",IND,ORD,DEST)) Q @WWLSTOCK@(LIEN,"F",IND,ORD,DEST)
 S @WWLSTOCK@(LIEN,"C")=@WWLSTOCK@(LIEN,"C")+1
 S RDEST=@WWLSTOCK@(LIEN,"D")
 S NUML=LIEN_"/"_@WWLSTOCK@(LIEN,"C")
 S @WWLSTOCK@(LIEN,"F",IND,ORD,DEST)=NUML
 S LIENV=@WWLSTOCK@(LIEN,"I")
 S @WWLSTOCK@(LIENV,"C")=@WWLSTOCK@(LIENV,"C")+1
 S NUMV=LIENV_"/"_@WWLSTOCK@(LIENV,"C")
 S @WWLSTOCK@(LIENV,"F",DEST,O2,IND)=NUMV
 G:MODE="INIT" LKINI
 S:$$AFFECT^%QWSTOE(TYPR,NR,@NEUE,RL,NUML,"NOM",1,NUML) @NEUE=0
 S:$$AFFECT^%QWSTOE(TYPR,NR,@NEUE,RL,NUMV,"NOM",1,NUMV) @NEUE=0
 S:$$AFFECT^%QWSTOE(TYPR,NR,@NEUE,REP,IND,LIEN,ORD,DEST) @NEUE=0
 S:$$AFFECT^%QWSTOE(TYPR,NR,@NEUE,RDEST,DEST,LIENV,O2,IND) @NEUE=0
 G FINLK
LKINI D AFF(MODE,RL,NUML,"NOM",1,NUML)
 D AFF(MODE,RL,NUMV,"NOM",1,NUMV)
 D AFF(MODE,REP,IND,LIEN,ORD,DEST)
 D AFF(MODE,RDEST,DEST,LIENV,O2,IND)
FINLK S @WWLSTOCK@(LIENV,"F",DEST,O2,IND)=NUMV
 Q NUML
 
AFF(M,R,I,A,O,V) 
 I M="EXEC" S (@WWSTOCK@(R,I,A,O),@WWINIT@(R,I,A,O),@WWORDAT@(R,I,A,O,0))=V Q
 I M="INIT" S @WWSTOCK@(R,I,A,O)=V Q
 Q
 
SUPR(R,I) 
 
 D MSG^%VZEATT($$^%QZCHW("Suppression dans l'espace de travail de")_" "_I)
 I '($$IR^%QSGEST5(R,I)) D SUP(MODE,R,I,"NOM",1) Q
 N %AL,%OL,%VL,A,AL,GL,ID,O,O2,OL,LI,LIX,LX,RD,RL,T,V,VL
 S RL=$$ONE^%QSGEL3("LIEN")
 
 S A=""
S2 S A=$$NXTRIA^%QSTRUC8(R,I,A) Q:A=""
 I ($E(A,1,8)="INVERSE.")!($E(A,1,5)="LIEN.") G S2
 S O=""
S3 S O=$$NXTRIAO^%QSTRUC8(R,I,A,O) G:O="" S2
 S V=$$VALEUR^%QSTRUC8(R,I,A,O)
 S T=$$TYPE^%QSGEST9(R,A)
 
 I T=0 D SUP(MODE,R,I,A,O) G S3
 
 
 
 S RD=@WWLSTOCK@(A,"D")
 
 S ID=$$NOM^%QSGES21(R,I,A,O)
 
 G:'($$EXIRI^%QWSTOL(RD,ID)) S3
 S LI=@WWLSTOCK@(A,"I")
 
 S LX=$$NOML1^%QSGES20(I,O,A,ID)
 S O2=$$OR^%QSCALVA(RD,ID,LI,$S(T=1:$$NOMEX^%QSGES10(R,I),1:I)),LIX=$$NOML1^%QSGES20(ID,O2,LI,I)
 D SUP(MODE,R,I,A,O)
 
 S AL="" F %AL=0:0 S AL=$$NXTRIA^%QSTRU8(RL,LX,AL) Q:AL=""  S OL="" F %OL=0:0 S OL=$$NXTRIAO^%QSTRUC8(RL,LX,OL) Q:OL=""  D SUP(MODE,RL,LX,AL,OL)
 
 S AL="" F %AL=0:0 S AL=$$NXTRIA^%QSTRU8(RL,LIX,AL) Q:AL=""  S OL="" F %OL=0:0 S OL=$$NXTRIAO^%QSTRUC8(RL,LIX,OL) Q:OL=""  D SUP(MODE,RL,LIX,AL,OL),SUP(MODE,RD,ID,LI,O2)
 
 K @WWLSTOCK@(LI,"F",ID,O2,I)
 K @WWLSTOCK@(A,"F",I,O,ID)
 G S3
 
SUP(M,R,I,A,O) 
 I M="EXEC" K @WWSTOCK@(R,I,A,O),@WWINIT@(R,I,A,O),@WWORDAT@(R,I,A,O,0) Q
 I M="INIT" K @WWSTOCK@(R,I,A,O) Q
 ;

