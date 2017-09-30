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

;%PKGLOB^INT^1^59547,73874^0
PKGLOB ;
 
 
 
 
 
 
 
 
 
 
 
INIT d LOAD,STO,READ^%PKREAD
 q
 
 
 
 
 
LOAD 
 d ^%QCAGLK("^%PKLOAD")
 s ^%PKLOAD="S %R=@GLO@(""V""),Y=@GLO@(""H"")_""\""_@GLO@(""FL"")_""WCY\2\""_@GLO_""\\"" X ^%PKLOAD(MODE)"
 
 s ^%PKLOAD(0)="X ^%PKLOAD(""LIBELLE""),^%PKLOAD(1,0) S X="""" F %X=1:1 S X=$O(@GLOCH@(X)) Q:X=""""  S %X=X+NBC,Y(%X)=@GLOCH@(X),VAL(X)=Y(%X),Y(%X)=Y(%X)_$J("""",L-$L(Y(%X)))"
 
 s ^%PKLOAD(1)="X ^%PKLOAD(""LIBELLE""),^%PKLOAD(1,0),^%PKLOAD(1,1),^%PKLOAD(1,2,ERRGL)"
 s ^%PKLOAD(1,0)="S X="""" F %X=0:0 S X=$O(@GLO@(""CLE"",X)) Q:X=""""  S PCLE(X)=@GLO@(""CLE"",X),CLE(PCLE(X))=@GLOCH@(X),%I=X+NBC,Y(%I)=@GLOCH@(X),VAL(X)=Y(%I)"
 s ^%PKLOAD(1,1)="S CLE="""" F %X=0:0 S X=$O(CLE(X)) Q:X=""""  S:CLE(X)="""" ERRGL=1 S CLE=CLE_$S(CLE(X)?.N:"",""_CLE(X),1:"",""""""_CLE(X)_"""""""")"
 s ^%PKLOAD(1,2,0)="S CLE=$S(SANSCLE=1:"""",1:$E(CLE,2,999)) X ^%PKLOAD(1,2,0,CLE="""")"
 s ^%PKLOAD(1,2,0,0)="S GL=$S(@GLOCH'[""("":@GLOCH_""(""_CLE_"")"",1:@GLOCH_"",""_CLE_"")"") S GL(1)=$S($E(GL,$L(GL))="")"":$E(GL,1,$L(GL)-1),1:GL) X ^%PKLOAD(1,3,$D(@GL)#10)"
 
 s ^%PKLOAD(1,2,0,1)="X ^%PKLOAD(1,2,0,1,$D(@GLO@(""CLE""))#10)"
 s ^%PKLOAD(1,2,0,1,0)="S GL=@GLOCH,GL=$S(GL[""("":GL_"")"",1:GL),GL1(1)=GL X ^%PKLOAD(1,3,$D(@GL)#10)"
 s ^%PKLOAD(1,2,0,1,1)="S ERRGL=2 X ^%PKLOAD(0)"
 s ^%PKLOAD(1,2,1)="S ERRGL=2 X ^%PKLOAD(0)"
 s ^%PKLOAD(1,3,0)="X ^%PKLOAD(1,5,MODEG)"
 s ^%PKLOAD(1,3,1)="S @(""CH=""_GL) X ^%PKLOAD(1,4)"
 s ^%PKLOAD(1,4)="F %X=1:1:NBC S X=NBC+%X,Y(X)=$P(CH,$C(0),%X),VAL(%X)=Y(X),Y(X)=Y(X)_$J("""",L-$L(Y(X)))"
 s ^%PKLOAD(1,5,0)="X ^%PKLOAD(0)"
 s ^%PKLOAD(1,5,1)="S ERRGL=1"
 s ^%PKLOAD(1,6)="F %X=0:0 S X=$O(Y(X)) Q:X=""""  S Y(X)=Y(X)_""*"",VAL(X-NBC)=Y(X)"
 s ^%PKLOAD("REINIT")="F %X=1:1:NBC S X=%X+NBC,(Y(X),VAL(%X))=$S($D(@GLO@(""RECUP"",%X)):VAL(%X),1:""""),Y(X)=Y(X)_$J("""",L-$L(Y(X)))"
 s ^%PKLOAD("LIBELLE")="F %X=1:1:NBC S Y(%X)=@GLO@(""CHAMPS"",%X)"
 q
 
 
 
 
 
READ 
 g SETUP^%PKREAD
 
 
 
 
 
STO 
 d ^%QCAGLK("^%PKSTO")
 s ^%PKSTO="S CH="""" X ^%PKSTO(2),^%PKSTO(1),^%PKSTO(3+(ERRGL=0))"
 
 s ^%PKSTO(1)="X ^%PKSTO(1,1),^%PKSTO(1,ERRGL+2)"
 
 s ^%PKSTO(1,1)="S CLE2="""",X="""" F %X=0:0 Q:ERRGL  S X=$O(PCLE(X)) Q:X=""""  S CLE2(PCLE(X))=VAL(X) S:VAL(X)="""" ERRGL=3"
 s ^%PKSTO(1,2)="X ^%PKSTO(1,3) S CLE2=$S(SANSCLE=1:"""",1:$E(CLE2,2,999)) X ^%PKSTO(1,4,CLE2=""""),^%PKSTO(1,3,MODE,UNIQ)"
 s ^%PKSTO(1,3)="S CLE2="""" F %X=0:0 S X=$O(CLE2(X)) Q:X=""""  S CLE2=CLE2_$S(CLE2(X)?.N:"",""_CLE2(X),1:"",""""""_CLE2(X)_"""""""")"
 
 s ^%PKSTO(1,3,0,0)="S @GL2=CH"
 
 s ^%PKSTO(1,3,0,1)="X $S($D(@GL2):""S ERRGL=4"",1:""S @GL2=CH"")"
 
 s ^%PKSTO(1,3,1,0)="X ^%PKSTO(1,3,MCLES+2)"
 
 s ^%PKSTO(1,3,2)="X $S(CLE'=CLE2:""S ERRGL=5"",1:""S @GL2=CH"")"
 
 s ^%PKSTO(1,3,3)="X ^%PKSTO(1,3,4+(GL'=GL2))"
 
 s ^%PKSTO(1,3,1,1)="X ^%PKSTO(1,3,4+(GL'=GL2))"
 
 s ^%PKSTO(1,3,4)="S @GL2=CH"
 
 s ^%PKSTO(1,3,5)="X $S($D(@GL2):""S ERRGL=4"",1:""D ADR^%QCAGLC(GL(1),GL2(1)) K:'DUP @GL S @GL2=CH"")"
 
 s ^%PKSTO(1,4,0)="S GL2=$S(@GLOCH'[""("":@GLOCH_""(""_CLE2_"")"",1:@GLOCH_"",""_CLE2_"")"") S GL2(1)=$E(GL2,1,$L(GL2)-1)"
 s ^%PKSTO(1,4,1)="S GL2=$S(@GLOCH'[""("":@GLOCH,1:@GLOCH_"")"") S GL2(1)=$S($E(GL2,$L(GL2))="")"":$E(GL2,1,$L(GL2)-1),1:GL2)"
 
 s ^%PKSTO(1,5)=""
 
 s ^%PKSTO(2)="F %R=1:1:NBC X ^%PKSTO(2,$D(VAL(%R))#10) S CH=CH_VAL(%R)_$C(0)"
 s ^%PKSTO(2,0)="S VAL(%R)="""""
 s ^%PKSTO(2,1)="X ^%PKREAD(""BLANC1"")"
 
 s ^%PKSTO(3)=""
 
 s ^%PKSTO(4)="I $D(@GLO@(""RECUP"")) S %R="""" F %X=0:0 S %R=$O(@GLO@(""RECUP"",%R)) Q:%R=""""  S @GLOCH@(%R)=VAL(%R)"
 
 s ^%PKSTO("STOCL0")=""
 s ^%PKSTO("STOCL1")="S %R="""" F %X=0:0 S %R=$O(@GLO@(""CLE"",%R)) Q:%R=""""  S @GLOCH@(%R)=VAL(%R)"

