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

;%TLBAVEF^INT^1^59547,74028^0
%TLBAVEF ;;10:24 AM  9 Aug 1993; 23 Apr 93 10:40 AM ; 28 Oct 93 11:33 AM
 
 
 
 
 
 
 
 
 
FONCT K @(TEMPO) S @TEMPO@(1)="SA",@TEMPO@(2)="IPAR",@TEMPO@(3)="IDEB",@TEMPO@(4)="TYPPAR",@TEMPO@(5)="NOMVERB"
 S @TEMPO@(6)="VAR1",@TEMPO@(7)="VAR2",@TEMPO@(8)="VAR3",@TEMPO@(9)="VAR4",@TEMPO@(10)="VAR5",@TEMPO@(11)="ADROU"
 F J=1:1:25 S @TEMPO@(J+11)="V"_J
 D EMPV^%ANGEPIL(TEMPO)
 S NOMVERB=TYP,SA=A
 S IPAR=0,IDEB=1,QUIT=0
FNXPAR S IPAR=IPAR+1
 
 I '($D(^[QUI]ANSA(SA,IPAR))) G:'($D(^%RQSGLO("MOTEUR","TRT","VERBE",NOMVERB,"NATURE.PARAMETRE",IPAR))) FFI G DEFF
 S TYPPAR=$$TYPPAR^%TLOCMP(NOMVERB,IPAR)
 G:TYPPAR="EXPR" FEXP
 G:TYPPAR="STRING" FSTR
 G:TYPPAR="REPERTOIRE" FREP
 G:TYPPAR="NOMIND" FNOM
 G:TYPPAR="INDIVIDU" IND
 G:TYPPAR="ATT" FATT
 G:TYPPAR="QUELCONQUE" QLQ
 G:TYPPAR="ATTRIBUT" ATTRIB
 G FEXP
 D:MODAF ADD^%TLIFEN("LOG",$$PBEVAL) S VAL="",POS=0 G DEPIL^%ANGEPIL
 
RETFG G FNXPAR
FFI I QUIT S VAL="",POS=0 G DEPIL^%ANGEPIL
 
 S ADROU=^%RQSGLO("MOTEUR","TRT","VERBE",NOMVERB,"ADRESSE.DE.LA.ROUTINE",1)
 S IDEB=IDEB-1
 
 I MODAF,$D(^%RQSGLO("MOTEUR","TRT","VERBE",NOMVERB,"TEXTE.PROLOGUE",1)) D ADD^%TLIFEN("LOG",$$^%QZCHW(^%RQSGLO("MOTEUR","TRT","VERBE",NOMVERB,"TEXTE.PROLOGUE",1)))
 D EXEC
 
 I MODAF,$D(^%RQSGLO("MOTEUR","TRT","VERBE",NOMVERB,"TEXTE.EPILOGUE",1)) D ADD^%TLIFEN("LOG",$$^%QZCHW(^%RQSGLO("MOTEUR","TRT","VERBE",NOMVERB,"TEXTE.EPILOGUE",1)))
 
 I MODAF,$D(^%RQSGLO("MOTEUR","TRT","VERBE",NOMVERB,"RAFRAICHIR.APRES.EXECUTION",1)),^%RQSGLO("MOTEUR","TRT","VERBE",NOMVERB,"RAFRAICHIR.APRES.EXECUTION",1)="OUI" D REAFF^%TLUTIL
 G DEPIL^%ANGEPIL
 
EXEC N V
 F J=1:1:IDEB S @("V(J)=V"_J)
 S @("VAL="_ADROU_"(1,"_IDEB_")")
 Q
 
 
 
FEXP S A=$$RED(SA,IPAR) D EMPIL^%ANGEPIL("FEXPR^%TLBAVEF") G INT^%ANARBR2
FEXPR I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$PBEVAL) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I VAL="" S @("V"_IDEB_"=$C(0)")
 I VAL'="" S @("V"_IDEB_"=VAL")
 S IDEB=IDEB+1
 G RETFG
 
 
 
FSTR S A=$$RED(SA,IPAR) D EMPIL^%ANGEPIL("FSTRR^%TLBAVEF") G INT^%ANARBR2
FSTRR I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$PBEVAL) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S @("V"_IDEB_"=VAL"),IDEB=IDEB+1
 G RETFG
 
 
 
 
FREP S A=$$RED(SA,IPAR)
 I A=0 S @("V"_IDEB_"=CXT(""@"",""BASE"")"),IDEB=IDEB+1 G RETFG
 D EMPIL^%ANGEPIL("FREPR^%TLBAVEF") G INT^%ANARBR2
FREPR I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$PBEVAL) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I VAL="" S @("V"_IDEB_"=CXT(""@"",""BASE"")"),IDEB=IDEB+1
 S VAL=$$NOMINT^%QSF(VAL)
 I VAL="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("Repertoire inconnu")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S @("V"_IDEB_"=VAL"),IDEB=IDEB+1
 G RETFG
 
 
 
FNOM S A=$$RED(SA,IPAR)
 I A=0 S @("V"_IDEB_"=CXT(""@"",""OBJET"")"),IDEB=IDEB+1 G RETFG
 D EMPIL^%ANGEPIL("FNOMR^%TLBAVEF") G INT^%ANARBR2
FNOMR I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$PBEVAL) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I VAL="" S @("V"_IDEB_"=CXT(""@"",""OBJET"")"),IDEB=IDEB+1 G RETFG
 S @("V"_IDEB_"=VAL"),IDEB=IDEB+1 G RETFG
 
 
 
 
IND S A=$$RED(SA,IPAR)
 I A=0 S @("V"_IDEB_"=CXT(""@"",""BASE"")"),@("V"_(IDEB+1)_"=CXT(""@"",""OBJET"")"),IDEB=IDEB+2 G RETFG
 S VAR1=$$RED(A,"TYPE") I VAR1="ATTRIBUT" S A=$$RED(A,1)
 S VAR1=$$RED(A,"TEXTE")
 I VAR1="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("Individu symbolique inconnu")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I ('($D(CXT(VAR1,"BASE"))))!('($D(CXT(VAR1,"OBJET")))) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("Individu symbolique inconnu")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S @("V"_IDEB_"=CXT(VAR1,""BASE"")"),@("V"_(IDEB+1)_"=CXT(VAR1,""OBJET"")"),IDEB=IDEB+2
 G RETFG
 
 
 
 
 
 
 
FATT S A=$$RED(SA,IPAR)
 I '($$ATTR^%TLBAVEA(A,1,.VAR1,.VAR2,.VAR3,.VAR4)) S MSG=$$^%QZCHW("Imposs. reconnaitre attribut"),POS=0 G DEPIL^%ANGEPIL
 D EMPIL^%ANGEPIL("FATTR^%TLBAVEF") G INT^%ANARBR2
FATTR 
 
 I (VAL="")!(POS=0) S VAL=$C(0)
 S @("V"_IDEB_"=VAR1"),@("V"_(IDEB+1)_"=VAR2"),@("V"_(IDEB+2)_"=VAR4"),@("V"_(IDEB+3)_"=VAR3"),@("V"_(IDEB+4)_"=VAL")
 S IDEB=IDEB+5
 G RETFG
 
 
QLQ S A=$$RED(SA,IPAR)
 I '($$ATTR^%TLBAVEA(A,$C(0),.VAR1,.VAR2,.VAR3,.VAR4)) S (VAR1,VAR2,VAR3,VAR4)=$C(0)
 D EMPIL^%ANGEPIL("FQLQ^%TLBAVEF") G INT^%ANARBR2
FQLQ 
 
 I (VAL="")!(POS=0) S VAL=$C(0)
 S @("V"_IDEB_"=VAR1"),@("V"_(IDEB+1)_"=VAR2"),@("V"_(IDEB+2)_"=VAR4"),@("V"_(IDEB+3)_"=VAR3"),@("V"_(IDEB+4)_"=VAL")
 S IDEB=IDEB+5
 G RETFG
 
 
 
 
 
 
 
 
ATTRIB S A=$$RED(SA,IPAR)
 I '($$ATTR^%TLBAVEA(A,$C(0),.VAR1,.VAR2,.VAR3,.VAR4)) S MSG=$$^%QZCHW("Imposs. reconnaitre attribut"),POS=0 G DEPIL^%ANGEPIL
 I (VAL="")!(POS=0) S VAL=$C(0)
 S @("V"_IDEB_"=0") I VAR4=CXT("%","BASE") S @("V"_IDEB_"=1")
 S @("V"_(IDEB+1)_"=VAR1"),@("V"_(IDEB+2)_"=VAR2"),@("V"_(IDEB+3)_"=VAR4"),@("V"_(IDEB+4)_"=VAR3")
 S IDEB=IDEB+5
 G RETFG
 
 
DEFF S TYPPAR=$$TYPPAR^%TLOCMP(NOMVERB,IPAR)
 I TYPPAR="EXPR" S @("V"_IDEB_"=$C(0)"),IDEB=IDEB+1 G RETFG
 I TYPPAR="STRING" S @("V"_IDEB_"="""""),IDEB=IDEB+1 G RETFG
 I TYPPAR="REPERTOIRE" S @("V"_IDEB_"=CXT(""@"",""BASE"")"),IDEB=IDEB+1 G RETFG
 I TYPPAR="NOMIND" S @("V"_IDEB_"=CXT(""@"",""OBJET"")"),IDEB=IDEB+1 G RETFG
 I TYPPAR="INDIVIDU" S @("V"_IDEB_"=CXT(""@"",""BASE"")"),IDEB=IDEB+1,@("V"_IDEB_"=CXT(""@"",""OBJET"")"),IDEB=IDEB+1 G RETFG
 S MSG=$$^%QZCHW("Un autre parametre etait attendu"),POS=0 G DEPIL^%ANGEPIL
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)
 
PBEVAL() 
 N MES
 I IPAR=1 S MES="   "_$$^%QZCHW("Impossible d'evaluer le premier parametre") Q MES
 S MES="   "_$$^%QZCHW("Impossible d'evaluer le")_" "_IPAR_" "_$$^%QZCHW("eme parametre") Q MES
 ;

