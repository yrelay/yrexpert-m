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

;%QARBEVA^INT^1^59547,73874^0
ARBEVAL(ARB,NOEUD,PERE,TAB) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N NMAT,VAL,VP
 I NOEUD'=PERE G TYPE
 
 S VAL=$$RETRAIT(GLAM,MATO,.NMAT)
 S @ARB@("NOM",NOEUD)=NOEUD
 
 S @ARB@("MAT",NOEUD,"ANCIENNE")=MATO
 S @ARB@("MAT",NOEUD,"NOUVELLE")=NMAT
 G FEVAL
TYPE 
 S VP=$$VAL^%QARBCON(ARB,PERE)
 
 I @TAB@("STO","TYPE",NOEUD)="INTERDIT" S VAL=VP+@TAB@("REGRET") G FEVAL
 
 S VAL=VP+$$RETRAIT(GLAM,@TAB@("STO","MAT",NOEUD,"ANCIENNE"),.NMAT)
 S @TAB@("STO","MAT",NOEUD,"NOUVELLE")=NMAT
 
FEVAL 
 D MSG^%VZEATT($$^%QZCHW("Valeur du noeud")_" "_NOEUD_" = "_VAL)
 Q VAL
 
RETRAIT(GL,ORI,MAT) 
 
 N %L,SOM,L
 S L="",SOM=0
 
 D COPM(GL,ORI,.MAT)
 
 F %L=0:0 S L=$O(@GL@(MAT,"COL",L)) Q:L=""  S SOM=SOM+$$RETR(GL,MAT,"COL",L)
 S L=""
 
 F %L=0:0 S L=$O(@GL@(MAT,"LIG",L)) Q:L=""  S SOM=SOM+$$RETR(GL,MAT,"LIG",L)
 D MAJ0(GL,MAT)
 Q SOM
 
RETR(GL,MAT,IND,N) 
 N D,MIN,VAL
 S D="",MIN=10E10
BRET S D=$O(@GL@(MAT,IND,N,D)) I D="" G RET1
 S VAL=@GL@(MAT,IND,N,D)
 I VAL=0 S MIN=0 G RET1
 I VAL<MIN S MIN=VAL
 G BRET
RET1 
 I MIN=0 Q MIN
 S D=""
RET2 S D=$O(@GL@(MAT,IND,N,D)) I D="" Q MIN
 S VAL=@GL@(MAT,IND,N,D)
 S @GL@(MAT,IND,N,D)=VAL-MIN,@GL@(MAT,$S(IND="LIG":"COL",1:"LIG"),D,N)=VAL-MIN
 G RET2
 
MAJ0(GL,MAT) 
 N %L,D,L
 K @GL@(MAT,"DIST")
 S L=""
 F %L=0:0 S L=$O(@GL@(MAT,"COL",L)) Q:L=""  S D="" D MA0
 Q
MA0 S D=$O(@GL@(MAT,"COL",L,D)) I D="" Q
 S V=@GL@(MAT,"COL",L,D)
 I V=0 S @GL@(MAT,"DIST",L,D)=""
 G MA0
 
COPM(GL,ORI,MAT) 
 S MAT=$ZP(@GLAM@(""))+1
 D GLOCOP^%QCAGLC($$CONCAT^%QZCHAD(GL,$S($$ADR^%QZNBN1(ORI):ORI,1:"""_ORI_""")),$$CONCAT^%QZCHAD(GL,$S($$ADR^%QZNBN1(MAT):MAT,1:"""_MAT_""")))
 Q
 
 
TEST 
 N %I,I,J,GLAM,MATO,NS,VAL
 S GLAM=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MATRICE")
 
 I $D(@GLAM) G SUIT
NS D POCLEPA^%VVIDEO S NS=$$^%VZAME1("Combien de sommets (de 4 a 7) ? ") Q:CTRLA=1
 I NS="" D SAIAL G SUIT
 I (NS>7)!(NS<4) G NS
 D @("SAI"_NS)
SUIT K ^GARBO
 F I=2:1 Q:'($D(@GLAM@(I)))  K @GLAM@(I)
 D DEB^%VTIME
 S MATO=1
 D ^%QARBCON("^GARBO","^%QARBEVA","^%QARBSEP","^%QARBSEL","A")
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Solutions possibles"),0)
 W !,! D AFF^%VTIME
 S I=""
 F %I=0:0 S I=$O(^GARBO("SOLUTION",I)) Q:I=""  W !,?35,"Valeur : ",^GARBO("SOLUTION",I) F J=1:1 Q:'($D(^GARBO("SOLUTION",I,J)))  W !,?20,^GARBO("SOLUTION",I,J)
 
 F I=2:1 Q:'($D(@GLAM@(I)))  K @GLAM@(I)
 Q
 
SAI7 
 F I="A","B","C","D","E","F","G" F J="A","B","C","D","E","F","G" D SAI
 Q
SAI6 
 F I="A","B","C","D","E","F" F J="A","B","C","D","E","F" D SAI
 Q
SAI5 
 F I="A","B","C","D","E" F J="A","B","C","D","E" D SAI
 Q
SAI4 
 F I="A","B","C","D" F J="A","B","C","D" D SAI
 Q
SAI I I=J S VAL=10E10
 E  W !,"Valeur de ",I,",",J R VAL
 S:VAL="" VAL=0
 S @GLAM@(1,"LIG",I,J)=VAL,@GLAM@(1,"COL",J,I)=VAL
 Q
SAIAL 
 S NS=7
 D MSG^%VZEATT($$^%QZCHW("Generation aleatoire des distances pour les 6 sommets"))
 F I="A","B","C","D","E","F","G" F J="A","B","C","D","E","F","G" S:I=J VAL=10E10 S:I'=J VAL=$R(50) S @GLAM@(1,"LIG",I,J)=VAL,@GLAM@(1,"COL",J,I)=VAL
 Q

