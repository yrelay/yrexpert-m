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

;%SRTRANS^INT^1^59547,73891^0
SRTRANS ;
 
 
 
 
 
 
 
 
 N GR,GLO,SA
CHS D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Retransfert de donnees"),0)
 S SA=$$UN^%PKCHOIX($$ADRS^%SRDESTI,1,3,17)
 Q:SA=""
 S GLO=$$ADROK^%SRBATCH(SA)
GR 
 S GR=$$CHGR
 I GR="" G CHS
 D TRAGR(SA,GR)
 G GR
 
TRAGR(SA,GR) 
 
 N %C,%R,CLE,GLAF,GLO,GLVAL,NUM,PK,TAB,TAB2,X,Y,GL1,CTR
 S GL1=$$ADROK^%SRBATCH(SA)
 S GLVAL=$$ADR^%SRACTIV(SA)
 S GLVAL=$E(GLVAL,1,$L(GLVAL)-1)
 S %R=22
 S Y="20\CHL\3\Transfert\\global,par enregistrements"
 D ^%PKPOP
 G:CTR'="" FTR
 
 I X=1 D COP($$CONCAT^%QZCHAD(GL1,GR_",""E""")) G FTR
 
 D CONS
 S TAB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLO") K @(TAB)
 S TAB2=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLO2") K @(TAB2)
 D PLUS^%PKCHOIP(GLAF,1,3,17,TAB2)
 S NUM=""
 F X=0:0 S NUM=$O(@TAB2@(NUM)) Q:NUM=""  S @TAB@(@GLAF@(NUM))=""
 K @(TAB2)
 I $D(@TAB) D COP(TAB)
 K @(GLAF),@(TAB)
 
FTR D POCLEPA^%VVIDEO
 Q
 
CHGR() 
 N NUM,I
 S NUM=$$NUM^%PKCHOIX(GLO,40,3,17,$$^%QZCHW("Date du transfert"),0)
 Q:NUM="" ""
 S GR=""
 F I=0:1 S GR=$O(@GLO@(GR)) Q:GR=""  I @GLO@(GR)=NUM Q
 Q GR
 
CONS 
 S GLAF=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CLE") K @(GLAF)
 S CLE=""
CO2 S CLE=$O(@GL1@(GR,"E",CLE)) Q:CLE=""
 S @GLAF@($E(CLE,1,75))=CLE
 G CO2
 
COP(GL) 
 I $$POCLE^%PKOUNO($$^%QZCHW("Confirmez-vous le transfert")_" ? ","N")'=1 Q
 N %I,ADR,ERR,ERRGL,CLE,GL2,GL3,GL4,GLERR,NB,PC
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Retransfert de donnees"),0)
 S GLERR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ERREUR")
 K @(GLERR)
 S GLO=$$ADR^%SRCOMP(SA)
 S NB=@GLO@("NBC")
 S I=""
 F %I=0:0 S I=$O(@GLO@("POSCLE",I)) Q:I=""  S PC(I)=@GLO@("POSCLE",I)
 W !,!
 S GL3=$E(GL,1,$L(GL)-1)
 S GL4=$$CONCAT^%QZCHAD(GL1,GR_",""E""")
 S GL4=$E(GL4,1,$L(GL4)-1)
 S ERR=0
 D ADR^%QCAGTW(GL3,"TRANS^%SRTRANS")
 I ERR'=0 D AFFER
 
FIN K @(GLERR)
 Q
 
TRANS 
 S (CLE,CH)="",ERRGL=0
 S REF=$P(%T,GL3,2),REF=$E(REF,2,$L(REF)-1)
 S ADR=GL4_","_REF_")",V=@ADR
 W !,REF
 F %I=1:1:NB S VAL(%I)=$P(V,$C(0),%I)
 X ^%PKREAD("POPER21")
 S C=""
 F %I=0:0 S C=$O(PC(C)) Q:C=""  S VA=VAL(PC(C)) S:VA="" ERRGL=1 S CLE=CLE_$S(VA?.N:","_VA,1:","""_VA_"""")
 S CLE=$E(CLE,2,999)
 S GL2=GLVAL_","_CLE_")"
 I $D(@GL2) S ERR=ERR+1,@GLERR@(ERR)=REF_" "_$$^%QZCHW("cle(s) deja existante(s)") Q
 F %I=1:1:NB S CH=CH_VAL(%I)_$C(0)
 S @GL2=CH
 W !,"     ",CLE
 Q
 
AFFER 
 S %R=4 D PARAM^%PKPOP("30\CWHRL\1\\\  erreurs trouvees ")
 S A=$$UN^%PKCHOIX(GLERR,5,5,16)
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CREER(SA,VAL,VISU,MES) 
 N C,CLE,ERRGL,VA,GLVAL,GL2,NB,CH,%I,GLO,OK,OKTOT,TO,II,I,%I,%RI,Y
 S MES="",%RI=2,Y=""
 S GLO=$$ADR^%SRCOMP(SA)
 I '($D(@GLO)) S MES=$$^%QZCHW("Saisie inexistante ou non validee") Q 0
 S NB=@GLO@("NBC")
 F %I=1:1:NB S:'($D(VAL(%I))) Y=Y_", "_%I
 I Y'="" S MES=$$^%QZCHW("Champs absent(s) :")_" "_$E(Y,2,999) Q 0
 D:'($D(^%PKREAD)) READ^%PKGLOB
 S I=1
 X ^%PKREAD("POPER21")
 X ^%PKREAD("VGRILG")
 I '(OKTOT) S MES=$$^%QZCHW("Erreur de validite de l'un des champs") Q 0
 S C="",CLE="",ERRGL=0
 F %I=0:0 S C=$O(@GLO@("POSCLE",C)) Q:C=""  S VA=VAL(@GLO@("POSCLE",C)) S:VA="" ERRGL=1 S CLE=CLE_$S(VA?.N:","_VA,1:","""_VA_"""")
 I ERRGL=1 S MES=$$^%QZCHW("Une des cles est absente") Q 0
 S CLE=$E(CLE,2,999)
 S GLVAL=$$ADR^%SRACTIV(SA)
 S GL2=$E(GLVAL,1,$L(GLVAL)-1)_","_CLE_")"
 I $D(@GL2) S MES=$$^%QZCHW("Cle(s) deja existante(s)") Q 0
 S CH=""
 F %I=1:1:NB S CH=CH_VAL(%I)_$C(0)
 S @GL2=CH
 Q 1
 ;

