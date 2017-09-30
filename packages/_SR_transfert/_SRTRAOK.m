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

;%SRTRAOK^INT^1^59547,73891^0
SRTRAOK ;
 
 
 
 
 
 
 
 
 
 
IND 
 N CLE,IND,REP
 D ^%VZCDB($$^%QZCHW("individus crees"),0)
 
 I '($D(@GLOK@(GR,"I"))) D MESS^%PKUTIL(20,22,$$^%QZCHW("aucun individu n'a ete cree"),1) Q
 I '($D(@AFFIC)) D TAB
CHI 
 S CLE=$$UN^%PKCHOIX(AFFIC,1,3,17)
 I CLE="" Q
 S REP=$P(@AFFIC@(CLE),$C(0),1),IND=$P(@AFFIC@(CLE),$C(0),2)
 I '($$IR^%QSGE5(REP,IND)) D MESS^%PKUTIL(20,22,$$^%QZCHW("Cet individu n'existe plus"),1) G I2
 
 D ^%QSATTRI(IND,REP,0,2,79,20)
 S DX=0,DY=2 D CLEBAS^%VVIDEO
 G CHI
 
TAB 
 N CH,I,R
 D ^%VZEATT
 S R=""
TR S R=$O(@GLOK@(GR,"I",R)) I R="" D POCLEPA^%VVIDEO Q
 S I=""
TI S I=$O(@GLOK@(GR,"I",R,I)) G:I="" TR
 S CH=$E($$NOMLOG^%QSF(R)_" "_I,1,75)
 S @AFFIC@(CH)=R_$C(0)_I
 G TI
 
 
 
VAL 
 N CLE,GLO
 S GLO=$$CONCAT^%QZCHAD(GLOK,GR_",""E""")
 I '($D(@GLO)) D MESS^%PKUTIL(20,22,$$^%QZCHW("aucune donnee n'a ete stockee"),1) Q
 I '($D(@GLAF)) D CONS
VISU 
 D ^%VZCDB($$^%QZCHW("donnees transferees"),0)
 S CLE=$$UN^%PKCHOIX(GLAF,1,3,17)
 I CLE="" Q
 D MODIF^%SRACTIV(SA,@GLO@(@GLAF@(CLE)),GLO,0)
 G VISU
 
CONS 
 S CLE=""
CO2 S CLE=$O(@GLO@(CLE)) Q:CLE=""
 S @GLAF@($E(CLE,1,75))=CLE
 G CO2
 
 
 
IMPIND 
 N CH,I,IMPR,L,R
 I '($D(@GLOK@(GR,"I"))) D MESS^%PKUTIL(20,22,$$^%QZCHW("aucun individu n'a ete cree"),1) Q
 I '($D(@AFFIC)) D TAB
 D ATT^%PKUTIL(20,22,$$^%QZCHW("impression en cours"),"HR")
 S IMPR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IMPR") K @(IMPR)
 S @IMPR@("TITRE",1)=" "
 S @IMPR@("TITRE",2)=$$^%QZCHW("Liste des individus crees lors du transfert")
 S CH=""
 F L=1:1 S CH=$O(@AFFIC@(CH)) Q:CH=""  S R=$$NOMLOG^%QSF($P(@AFFIC@(CH),$C(0),1)),R=$E(R,1,25),I=$P(@AFFIC@(CH),$C(0),2),I=$E(I,1,50),@IMPR@("LIGNE",L)="  "_R_$J("",25-$L(R))_" "_I_$J("",50-$L(I))
 D IMPT^%VPRINT($$CONCAS^%QZCHAD(IMPR,"LIGNE"),$$CONCAS^%QZCHAD(IMPR,"TITRE"))
 D MESS^%PKUTIL(20,22,$$^%QZCHW("impression terminee"),1)
 K @(IMPR)
 Q
 
 
 
IMPVAL 
 N CH,GL,GLO,I,IMPR,LARG,LC,LIB,LIGN,NC,VAL
 S GLO=$$CONCAT^%QZCHAD(GLOK,GR_",""E""")
 I '($D(@GLO)) D MESS^%PKUTIL(20,22,$$^%QZCHW("aucune donnee n'a ete stockee"),1) Q
 I '($D(@GLAF)) D CONS
 D ATT^%PKUTIL(20,22,$$^%QZCHW("impression en cours"),"HR")
 S GL=$$ADR^%SRCOMP(SA)
 S IMPR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IMPR") K @(IMPR)
 S @IMPR@("TITRE",1)=" "
 S @IMPR@("TITRE",2)=$$^%QZCHW("Liste des valeurs stockees lors du transfert")
 
 S LC=3,(LIGN,CH)=""
 F I=0:0 S CH=$O(@GL@("CHAMPS",CH)) Q:CH=""  D TIT
 S LC=1,(LIGN,CH)=""
 
 S NC=@GL@("NBC")
 
 F I=0:0 S CH=$O(@GLAF@(CH)) Q:CH=""  S VAL=@GLO@(@GLAF@(CH)) D LIGN
 D IMPT^%VPRINT($$CONCAS^%QZCHAD(IMPR,"LIGNE"),$$CONCAS^%QZCHAD(IMPR,"TITRE"))
 D MESS^%PKUTIL(20,22,$$^%QZCHW("impression terminee"),1)
 K @(IMPR)
 Q
 
TIT 
 
 S LIB=@GL@("CHAMPS",CH)
 
 I $D(@GL@("CLE",CH)) S LIB=LIB_" ("_@GL@("CLE",CH)_")"
 
 S LARG(CH)=@GL@("LARG",CH)
 D INS(CH,"TITRE")
 Q
 
INS(CH,IND) 
 S LIB=$E(LIB,1,LARG(CH)),LIB=LIB_$J("",LARG(CH)-$L(LIB))
 
 I ($L(LIGN)+$L(LIB))>80 S @IMPR@(IND,LC)=LIGN,LC=LC+1,LIGN=""
 S LIGN=LIGN_LIB_" "
 Q
 
LIGN 
 F I=1:1:2 S @IMPR@("LIGNE",LC)=" ",LC=LC+1
 F I=1:1:NC S LIB=$P(VAL,$C(0),I) D INS(I,"LIGNE")
 Q:LIGN=""
 S @IMPR@("LIGNE",LC)=LIGN,LC=LC+1,LIGN=""
 Q

