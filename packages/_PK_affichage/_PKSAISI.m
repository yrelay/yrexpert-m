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
;! Nomprog     : %PKSAISI                                                     !
;! Module      : ECRAN                                                        !
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

%PKSAISI ;
PKSAISI(MODE,MODEG,REAFF,MCLE,UNIQ,GLO,GLOCH,ERRGL) 
 
 N ABANDON,SANSCLE,AFFONLY
 
 S SANSCLE=0,AFFONLY=0
 
ENTREE1 N BOAJ
 S BOAJ=$S(MODE=0:@GLO@("BOU.AJOUT"),1:0)
 
ENTREE2 N %CH,%LCH,%ICH,%CACH,II,GEN,CTR
 N Y,%X,X,%R,NBC,L,I,X,TO,ARRET,PCLE,CLE,CLE2,REUC
 N GL,GL2,CH,ML,%I,%L,ESC,INS,%I,%J,%C,LNG,X,B,%L,PREC,SUIV
 N POSY,%IC,%LNG,PROMPT,MAX,MIN,CHR,PAT,TRM,ZF,MESTO
 N MRET,BOER,EXUC,%RI,VAL,LIN,LARG,DUP,VISU,OK,OKTOT
 
 N TW,TD,TM,TR,TRO,TB
 S MRET=@GLO@("STO.DER")
 S GEN=MODE'=1
 S DUP=0,VISU=1,ABANDON=0,REUC=0
 I MODE=2 S MODE=1,MCLE=1,UNIQ=1,DUP=1
 S BOER=@GLO@("BOU.ERREUR")
 S EXUC=@GLO@("EXEC.UCONT")
 S %RI=@GLO@("V"),LIN=""
 S MESTO=$$^%QZCHW("stockage")_"*"
 S ERRGL=0,NBC=@GLO@("NBC"),L=@GLO@("L")
 D:'($D(^%PKREAD)) READ^%PKGLOB
 D:'($D(^%PKLOAD)) LOAD^%PKGLOB
 X ^%PKLOAD
 X ^%PKREAD("POPER1"_GEN)
 G @ERRGL
 
0 
 D PARAM^%PKPOP(.Y)
 Q:AFFONLY
 X ^%PKREAD("INIT"_LIN)
BER1 
 S ARRET=0,ERRGL=0
 
00 
 I REUC S %R=%RI D PARAM^%PKPOP(.Y) S REUC=0
 X ^%PKREAD("CHAMP")
 X ^%PKREAD
 G:TO="ABAND" 01
 X ^%PKREAD("UCCH"_($D(@GLO@("UCONT.CHAMPS",I))#10))
 G:'(OK) 00
 X ^%PKREAD("VCHAMP"_EXUC)
 G:'(OK) 00
 S VAL(I)=X,Y(I+NBC)=X_$J("",LARG(I)-$L(X))
 X ^%PKREAD(TO)
 G @(ARRET_ABANDON)
10 
 X ^%PKREAD("UCONT"_($D(@GLO@("UCONT"))#10))
 G:'(OK) @("BER"_BOER)
 X ^%PKREAD("VGRIL"_EXUC)
 G:'(OKTOT) @("BER"_BOER)
 D:'($D(^%PKSTO)) STO^%PKGLOB
 X ^%PKSTO
 G @("ST"_ERRGL)
 
ST3 D ERR($$^%QZCHW("Il manque une cle"),BOER)
 G @("BER"_BOER)
 
ST4 D ERR($$^%QZCHW("Existe deja"),BOER)
 G @("BER"_BOER)
 
ST5 D ERR($$^%QZCHW("Interdit de modifier les cles"),BOER)
 G @("BER"_BOER)
 
ST0 
 X ^%PKSTO("STOCL"_($D(@GLO@("CLE"))#10))
 I BOAJ,$D(@GLO@("CLE")) S %R=%RI D PARAM^%PKPOP(@GLO@("H")_"\CHRW\1\\\"_MESTO) S %R=%RI X ^%PKLOAD("REINIT"),^%PKREAD("POPER1"_GEN) S LIN=3 G 0
 X ^%PKREAD("NORM")
 Q
BER0 
01 S ABANDON=1
 X ^%PKREAD("NORM")
 Q
 
1 
 D ERR($$^%QZCHW("Pas d'informations correspondant aux cles"),1)
 G BER0
 
2 
 D ERR($$^%QZCHW("cles incompletes"),1)
 G BER0
 
ERR(MERR,REAF) 
 N TO
 I REAF S %R=%RI D PARAM^%PKPOP(.Y)
 X ^%PKREAD(7)
 S %R=%RI
 S MERR=$E(MERR,1,75-@GLO@("H"))
 D PARAM^%PKPOP(@GLO@("H")_"\CHRL\1\\\"_MERR_"*")
 S %R=%RI
 Q:'(REAF)
 D PARAM^%PKPOP(.Y)
 S %R=%RI
 Q
 
MERVL(VAL,NOC) 
 N TO,MERR
 X ^%PKREAD(7)
 S %R=%RI
 S MERR=$E(""""_@GLO@("CHAMPS",NOC)_""" : "_VAL_" "_$$^%QZCHW("n'est pas une valeur legale"),1,75-@GLO@("H"))
 D PARAM^%PKPOP(@GLO@("H")_"\CHRL\1\\\"_MERR_"*")
 S %R=%RI
 D PARAM^%PKPOP(.Y)
 S %R=%RI
 Q
 
MERFO(VAL,NOC) 
 N TO,MERR
 X ^%PKREAD(7)
 S %R=%RI
 S MERR=$E(""""_@GLO@("CHAMPS",NOC)_""" : "_VAL_" ; "_$$^%QZCHW("format incorrect"),1,75-@GLO@("H"))
 D PARAM^%PKPOP(@GLO@("H")_"\CHRL\1\\\"_MERR_"*")
 S %R=%RI
 D PARAM^%PKPOP(.Y)
 S %R=%RI
 Q
 
MEROBL(VAL,NOC) 
 N TO,MERR
 X ^%PKREAD(7)
 S %R=%RI
 S MERR=$E(""""_@GLO@("CHAMPS",NOC)_""" : "_$$^%QZCHW("valeur obligatoire"),1,75-@GLO@("H"))
 D PARAM^%PKPOP(@GLO@("H")_"\CHRL\1\\\"_MERR_"*")
 S %R=%RI
 D PARAM^%PKPOP(.Y)
 S %R=%RI
 Q
 
HELP(I) 
 I '($D(@GLO@("AIDE",I))) X ^%PKREAD(7) Q
 N Y2,I2,%R,TO,LH,T,LL,%I,%I2
 S Y2=10_"\CHYRL\1\\\"
 S LH=@GLO@("AIDE",I),LL=1
 F I2=1:1:18 S T=$P(LH,$C(0),I2) I T'="" S Y2(I2)=T,%I2=LL,LL=I2+1 F %I=%I2:1:I2-1 S Y2(%I)=""
 S %R=3
 D PARAM^%PKPOP(.Y2)
 S %R=%RI
 D PARAM^%PKPOP(.Y)
 S %R=%RI
 Q
 
 
 
 
 
 
 
EXT(REAFF,GLO,GLOCH,ERRGL,ABANDON) 
 N MODE,MODEG,MCLE,UNIQ,BOAJ,SANSCLE,AFFONLY
 S MODE=0,MODEG=0,MCLE=1,UNIQ=0,BOAJ=0,SANSCLE=1,AFFONLY=0
 G ENTREE2
 
 
 
 
ABAND(MODE,MODEG,REAFF,MCLE,UNIQ,GLO,GLOCH,ERRGL,ABANDON) 
 N SANSCLE,AFFONLY
 S SANSCLE=1,AFFONLY=0
 G ENTREE1
 
 
AFF(MODE,MODEG,REAFF,MCLE,UNIQ,GLO,GLOCH,ERRGL) 
 N SANSCLE,AFFONLY
 S SANSCLE=1,AFFONLY=1
 G ENTREE1
 ;

