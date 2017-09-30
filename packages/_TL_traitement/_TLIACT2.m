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

;%TLIACT2^INT^1^59547,74029^0
%TLIACT2 ;
 
 
 
 
 
 
 
 
 
SOM N BB,LA
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Somme"))
 N REPTOT,INDTOT,ATTOT,REPSOM,OBSOM,OBTOT,INDSOM,ATSOM,VAL,LVAL,TYP,%I
 Q:'($$ATTR^%TLIACT4($$RED(ACTI,2),.ATTOT,.INDTOT,.OBTOT,.REPTOT))
 G:ATTOT'=$$^%QZCHW("NOM") SSOM0
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit modifier attribut NOM")) Q
SSOM0 G:$$TYPE^%QSGEST9(REPTOT,ATTOT)=0 SSOM1
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit modifier un lien")) Q
SSOM1 Q:'($$ATTR^%TLIACT4($$RED(ACTI,1),.ATSOM,.INDSOM,.OBSOM,.REPSOM))
 D MVI^%QSCALVA(REPSOM,OBSOM,ATSOM,.LVAL,.TYP)
 S BB=0,VAL="",TYP="" F %I=0:0 S TYP=$O(LVAL(TYP)) Q:TYP=""  S BB=BB+1,VAL=VAL+LVAL(TYP)
 S LA=ATSOM S:BB>1 LA=LA_" (multivalue)"
 D ATT^%TLIACT3(LA,VAL)
 Q:VAL=""
 G:$E(ATTOT)'="%" SOMNL
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ATTOT,VAL,INDTOT)
 D:MODEX=2 STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),ATTOT,VAL,INDTOT,$S($$^%QSCALIN(CXT("%","BASE"),CXT("%","OBJET"),ATTOT,INDTOT)="":"AJOUT",1:"MODIFICATION"))
 G SSOM
 
SOMNL D:MODEX'=1 PA^%QSGESTI(REPTOT,OBTOT,ATTOT,VAL,INDTOT)
 D:MODEX=2 STATT^%TLBAATT(REPTOT,OBTOT,ATTOT,VAL,INDTOT,$S($$^%QSCALIN(REPTOT,OBTOT,ATTOT,INDTOT)="":"AJOUT",1:"MODIFICATION"))
SSOM D:MODAF ADD^%TLIFEN("ATT",ATTOT_"<---"_VAL)
 Q
 
 
 
MOY N POSS,ATT,LIS,VAL,OR,VLI,IN,VAR,REP2,ATOT,AA,OO,II,RR,VALI,TYP,V
 N REPI,OBJI,NBI,BASE,PREF,GVAL,GLR,AT,L,SUF
 S GLR=$$TEMP^%SGUTIL
 S GVAL=$$TEMP^%SGUTIL
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Moyenne"))
 S AT=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POSS)
 I (AT="")!('(POSS)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Attribut dont il faut calculer la moyenne impossible a determiner")) S VAL="",ECHEC=1 Q
 S ATOT=$$RED(ACTI,4)
 I ATOT=0 S L=LISTE G MOY2
 S L=$$SUBST^%ANARBR2(ATOT,.CXT,"ATT^%TLIACT3",.POSS)
 I (L="")!('(POSS)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Nom de la liste impossible a determiner")) S VAL="",ECHEC=1 Q
 I '($$IR^%QSGE5("L0",L)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste inconnue")) S VAL="",ECHEC=1 Q
MOY2 S REPI=$$^%QSCALVA("L0",L,"OBJET")
 S NBI=$$^%QSCALVA("L0",L,"CARD")
 S REPI=$$NOMINT^%QSF(REPI)
 S PREF=$$^%QSCALVA("L0",L,"ADRESSE")
 I '($$AR^%QSGE5(REP,AT)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Attribut inconnu pour les individus de la liste")) S VAL="",ECHEC=1 Q
 S NAR=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POSS)
 S SUF=""
MOY3 
 S SUF=$O(@PREF@(SUF))
 I SUF="" G MOY4
 K @(GVAL)
 D MVG^%QSCALVA(REP,SUF,AT,GVAL,.TYP)
 I @GVAL=0 G MOY3
 S INO="" F %I=1:1 S INO=$O(@GVAL@(INO)) Q:INO=""  S VAL=@GVAL@(INO) S:'($D(@GLR@(INO))) @GLR@(INO)="" S @GLR@(INO)=@GLR@(INO)+VAL
 G MOY3
MOY4 S:NBI=0 NBI=1
 S IVAL="" F %I=1:1 S IVAL=$O(@GLR@(IVAL)) Q:IVAL=""  S VAL=@GLR@(IVAL)/NBI D:MODEX=2 STATT^%TLBAATT("L0",L,NAR,VAL,IVAL,"AJOUT") D:MODAF ADD^%TLIFEN("ATT",NAR_" <-- "_VAL) D:MODEX'=1 PA^%QSGESTI("L0",L,NAR,VAL,IVAL)
 K @(GLR),@(GVAL)
 Q
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

