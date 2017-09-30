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

;%QSVERI6^INT^1^59547,73883^0
QSVERI6 ;
AFF 
 
 
 
 
 N RESTE
 S RESTE=$$CONCAS^%QZCHAD(TEMP,"RESTE") K @(RESTE)
 N NCMAX,REP,REPMAX,NHIER,HIERAR,NREP,NREPMAX,REP1,REP2
 N LIEN,U,%U,LIENR,TYP,LIB,GLIEN,IC,NL,CH,CLE
 S NHIER=0
 K GLIEN
 
 
 
 S REP=$O(@TEMPO@(M,"NOMBRE DE CLES",""))
 F I=0:0 Q:REP=""  S @RESTE@(REP)=@TEMPO@(M,"NOMBRE DE CLES",REP),REP=$O(@TEMPO@(M,"NOMBRE DE CLES",REP))
 
 
 
DEBUT D NCMAX
 G:NCMAX=0 FIN
 S NHIER=NHIER+1,NREP(NHIER)=NCMAX
 
 
 
 S FILS=REPMAX,HIERAR(NHIER)=FILS_"^" K @RESTE@(FILS)
 F I=1:1:NCMAX-1 D CONSTRUC
 G DEBUT
 
 
 
FIN 
 K @(COL)
 S @COL@("LGC")=15,@COL@("TITC")="COMMENTAIRE"
 F I=1:1:NHIER S @COL@("COL",I)="HIER"_I_"^"_18_"^HIER"_I
 S @COL@("MSG")=" SCHEMA "_M,@COL@(1)=NHIER_" Hierarchie(s)"
 F I=1:1:NHIER F II=1:1:NREP(I) S:II'=1 @COL@(II)="" S @COL@(II,"HIER"_I)=$P(HIERAR(I),"^",(NREP(I)-II)+1)
 
 S NREPMAX=0 F I=1:1:NHIER S NREPMAX=$$MAX(NREPMAX,NREP(I))
 S GLIEN("H")=0,GLIEN("R")=0,GLIEN("I")=0
 D LIEN
 
 S LIB=NREPMAX+1,NL=GLIEN("H")
 S @COL@(LIB)="",@COL@(LIB+1)=NL_" Lien(s) ",@COL@(LIB+2)="hierarchiques(s)" F II=LIB+3:1:LIB+NL S @COL@(II)=""
 S IC="" F %U=1:1 S IC=$O(GLIEN("H",IC)) Q:IC=""  S CH=GLIEN("H",IC) D SCOL
 S @COL@(LIB,"HIER1")="",@COL@(LIB,"HIER2")="",@COL@(LIB,"HIER3")=""
 
 S LIB=(LIB+1)+NL,NL=GLIEN("R")
 S @COL@(LIB)="",@COL@(LIB+1)=NL_" Lien(s) ",@COL@(LIB+2)="relationnel(s)" F II=LIB+3:1:LIB+NL S @COL@(II)=""
 S IC="" F %U=1:1 S IC=$O(GLIEN("R",IC)) Q:IC=""  S CH=GLIEN("R",IC) D SCOL
 S @COL@(LIB,"HIER1")="",@COL@(LIB,"HIER2")="",@COL@(LIB,"HIER3")=""
 
 S LIB=(LIB+1)+NL,NL=GLIEN("I")
 S @COL@(LIB)="",@COL@(LIB+1)=NL_" Lien(s) ",@COL@(LIB+2)="involutif(s)" F II=LIB+3:1:LIB+NL S @COL@(II)=""
 S IC="" F %U=1:1 S IC=$O(GLIEN("I",IC)) Q:IC=""  S CH=GLIEN("I",IC) D SCOL
 S @COL@(LIB,"HIER1")="",@COL@(LIB,"HIER2")="",@COL@(LIB,"HIER3")=""
 D ^%QUKOLO,^%VZEAVT("")
 K @(COL),GLIEN
 Q
SCOL N R1,R2,LI
 S R1=$P(CH,"^",1),R2=$P(CH,"^",2),LI=$P(CH,"^",3)
 S @COL@(LIB+%U,"HIER1")=R1,@COL@(LIB+%U,"HIER2")="---> "_R2,@COL@(LIB+%U,"HIER3")="via "_LI
 Q
 
NCMAX S REP=$O(@RESTE@("")),NCMAX=0
 F I=0:0 Q:REP=""  S NCMAX=$$MAX(NCMAX,@RESTE@(REP)) S:NCMAX=@RESTE@(REP) REPMAX=REP S REP=$O(@RESTE@(REP))
 Q
 
CONSTRUC 
 S PERE=""
 F J=0:0 S PERE=$O(@TEMPO@(M,"LIES",FILS,PERE)) Q:PERE=""  S LIEN="" F U=0:0 Q:PERE=""  S LIEN=$O(@TEMPO@(M,"LIES",FILS,PERE,LIEN)) Q:LIEN=""  D:$P(@TEMPO@(M,"LIES",FILS,PERE,LIEN),"^",1)=1 VER61
 Q
VER61 S HIERAR(NHIER)=HIERAR(NHIER)_PERE_"^",FILS=PERE K @RESTE@(PERE) S PERE=""
 Q
 
LIEN 
 S REP1=""
 F I=1:1 S REP1=$O(@TEMPO@(M,"LIES",REP1)) Q:REP1=""  D SUITE
 Q
SUITE S REP2=""
 F J=1:1 S REP2=$O(@TEMPO@(M,"LIES",REP1,REP2)) Q:REP2=""  S LIENR="" F %U=0:0 S LIENR=$O(@TEMPO@(M,"LIES",REP1,REP2,LIENR)) Q:LIENR=""  D SUITE1
 Q
SUITE1 S TYP=$P(@TEMPO@(M,"LIES",REP1,REP2,LIENR),"^",1)
 S CLE=$S(TYP=1:"H",TYP=2:"H",TYP=3:"R",TYP=4:"I",TYP=5:"I")
 S IC=GLIEN(CLE)+1,GLIEN(CLE,IC)=REP1_"^"_REP2_"^"_LIENR
 S GLIEN(CLE)=IC
 Q
 
MAX(A,B) 
 Q:A>B A Q B
 ;

