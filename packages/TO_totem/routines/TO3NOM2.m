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

;TO3NOM2^INT^1^59547,74870^0
TO3NOM2 ;
 
INIT K FMATSEL,MATSEL D ^TO3CHARV
 
DEB S %ABEND=0 K NEWNODE S @%TBEV@("CARDMAT")=0,@%TBEV@("CARDIMP")=0,@%TBEV@("CARDNOM")=0,NOMTREE="^[QUI]TREEWORK(NUFA",ADR="TRAIT^TO3NOM2"
 D ^%QCAGTU1 G:%ABEND=2 FIN
 I %ABEND=1 S TREETUD(NUFA)=$$^%QZCHW("ARRET") Q
 I @%TBEV@("CARDMAT")>0 D ^TO3NEWTR S %ABEND=2 G FIN
 I @%TBEV@("CARDNOM")>0 D ^TO3STREE G DEB
 S RGC=^NBRGLEV($I,NUFA,"COUR"),RGO=^NBRGLEV($I,NUFA,"OLD") I RGC>RGO S ^NBRGLEV($I,NUFA,"OLD")=RGC K RGC,RGO G DEB
 S OK=0 D ^TODBLSIT G:OK=1 DEB
 G FIN
TRAIT S %N10=1 S:'($D(VU)) VU=1 D GETREF G FIN:$D(^PHASADM($I,NUFA,"%ABEND",TWREF)),FIN:(TWREF'=@%TBEV@("%BTW"))&(VU=0) S REFUS=0
 S DATACOUR=@NOM,YA=$P(DATACOUR,"^",1),YB=$P(DATACOUR,"^",2),QT=$P(@NOM,"^",3) D ^TO3PRES G:$D(^ETUDIE(NUFA,TWREF)) FIN D ^TO3GETV,^TO3RPERE S A1=$S(@%TBEV@("%LIA")="":"IMPL",@%TBEV@("%LIA")="?":"IMPL",1:@%TBEV@("%LIA")) G @A1
IMPL D K1^TO3NOM1 S @%TBEV@("%LIA")="?" D ^TO3IMBIS G FIN:$D(^PHASADM($I,NUFA,"%ABEND",TWREF)) D:YA["~" ^TOCHVYB D K2^TO3NOM1 I %ABEND'=0 S STOP=1,@%TBEV@("CARDMAT")=0,@%TBEV@("CARDNOM")=0,@%TBEV@("CARDIMP")=0 S:%ABEND=1 TREETUD(NUFA)=$$^%QZCHW("ARRET") G FIN
PHAS S @%TBEV@("%LIA")="?",%N10=1,%TPH="^GLOETUD($I,NUFA,TWREF,""PHAS"",%N10)" D ^TO3PHAS1,K3^TO3NOM1 G:%ABEND'=0 PAB1
MACH S @%TBEV@("%LIA")="?",%TPH="^[QUI]GLOETUD(YA,""SELMAC"",%N10)",%N10=1 D ^TO3ETMAC,K4^TO3NOM1 G:%ABEND'=0 PAB1
FORM S @%TBEV@("%LIA")="?" D ^TO3NFORM,K5^TO3NOM1 G:%ABEND'=0 PAB1
AUTRF S @%TBEV@("%LIA")="?" D ^TOGAUTRF G:%ABEND'=0 PAB1
DIMO S @%TBEV@("%LIA")="?" D ^TODIMOUT,K6^TO3NOM1 G:%ABEND'=0 PAB1
OUTC S @%TBEV@("%LIA")="?" D ^TO3OUTCO,K6^TO3NOM1 G:%ABEND'=0 PAB1
MATI S @%TBEV@("%LIA")="?" D ^TO3GMAT,K1 G:%ABEND'=0 PAB1 I @%TBEV@("CARDMAT")>0 S STOP=1 G FIN
COMP S @%TBEV@("%LIA")="?" D ^TO3COBIS S:%ABEND=1 STOP=1 D ^TOSITUCP S:@%TBEV@("CARDNOM")>0 STOP=1
FIN Q
PAB1 S STOP=1 S:%ABEND=1 TREETUD(NUFA)=$$^%QZCHW("ARRET") G FIN
GETREF S TWREF="" F RR=2:1 Q:'($D(B(RR)))  S TWREF=TWREF_B(RR)_","
 S TWREF=$E(TWREF,1,$L(TWREF)-1),^NEXSUN($I,TWREF)=$S($D(^NEXSUN($I,TWREF)):^NEXSUN($I,TWREF)+1,1:1)
 G FIN
K1 K %21,%2PR,%ABC,%APAR,%CAR,%CONDIT,%ERR,%IFLAG,%IID,%INT,%LIB1,%MORDEF,%NBPAR,%OOLTREF,%OPR2,%PCH,%PG,%POR,%RESUL,%RESULT,%RESULTA,%SCPR,%TAB,%TAD,%TB,%TBL,ACCEPT,AFFECT,ATEST,C,COK,COND1,CONDIT,CONTAF,DATAC,DATACOUR,DATAP,E,EXPFONC,FER,FERP
 K IND,ISNUM,IU,MSG,NAMTAB,NCLE,NCONS,NFOR,NTABN,OOLDTREE,PAR3,PARA,PBIS,PL,PND,PNUM,PRGDEF,QQ,QTP,QUW,RBIS,REF,REFUS,RES1,ROUTI,RR,SFMA2,SIF,SMF,SOURCE,TAUX,TC,TDEF,TOZEA,TOZEC,TRACE,TSDEF,TT,TYP,UNI,UU,V,VAL,VN,VP,YA3,Z2,ZW Q

