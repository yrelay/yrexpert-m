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

;LKRQST3^INT^1^59547,74867^0
LKRQST3 ;
 
 
 
 
 
 
 
 
CRPER(REF,NUM,REP) 
 N GL,OR,ORD,ER,IND,MSG,REPL
 S ER=$$LOAMV^LKZPAR(TEMP,"NOM~"_REF,.GL)
 
 S OR=$O(GL(""))
 S IND=GL(OR)
 S REPL=$$NOMLOG^%QSF(REP)
 
 I NUM'=1 S IND=@GLO@("PERE",NUM-1)_","_IND
 D MSG^%VZEATT($$^%QZCHW("repertoire")_" "_REPL_" : "_IND)
 I $$IR^%QSGE5(REP,IND) G MAJ
 
 S ER=$$LOAMV^LKZPAR(TEMP,"ORDRE",.ORD)
 S OR=$O(ORD(""))
 I OR="" S ORD=""
 I OR'="" S ORD=ORD(OR)
 S OR=$$CREPER^%QSGEIND(REP,IND,ORD,.MSG)
 I OR D MSG^%VZEATT(MSG) Q 1
MAJ D PA^%QSGESTI(REP,IND,"DATE.RECUPERATION.PASSERELLE",$$TEMPSNO^%QMDATE(DD),1)
 S @GLO@("IND",EREP_"~"_REF,"IND")=IND
 S @GLO@("IND",EREP_"~"_REF,"BASE")=REP
 S @GLO@("PERE",NUM)=IND
 Q 0
 
CREL() 
 N NT,LIEN,CHEMPR
 S NT=$L(PARA,"~")
 
 
 Q:'($$EXIL(PARA)) 1
 
 S LIEN=$P(PARA,"~",NT)
 Q:LIEN="" 0
 S CHEMPR=$P(PARA,"~",1,NT-1)
 Q:'($$CRIND(@GLO@("IND",CHEMPR,"BASE"),@GLO@("IND",CHEMPR,"IND"),$P(PARA,"~",2,NT),LIEN)) 1
 K @GLO@("LIEN",PARA)
 Q 0
 
EXIL(CH) 
 N N,AT,DC,NT
 S N=2,NT=$L(CH,"~")
EXB 
 Q:N=NT 1
 S DC=$P(CH,"~",N),AT=$P(CH,"~",1,N-1)
 I $E(DC,1,5)="LIEN." S DC=$E(DC,6,99) G EXB2
 G:$E(DC,1,5)'="INVERSE." EXB2
 S DC=$$INVL^LKYG2(@GLO@("IND",AT,"BASE"),DC)
EXB2 S AT=AT_"~"_DC
 I '($D(@GLO@("IND",AT))) Q 0
 S N=N+1
 G EXB
 
CRIND(REP,INDP,REF,LIEN) 
 
 N GL,OR,ORD,TYPE,ER,INDL,BASEL,MSG,IDLIEN,NOMLIEN
 S GL=""
 S TYPE=$$TYPE^%QSGEST9(REP,LIEN)
 
 I $D(@GLO@("IND",PARA)) S INDL=@GLO@("IND",PARA,"IND"),BASEL=@GLO@("IND",PARA,"BASE") G LIEN
 S ER=$$LOAMV^LKZPAR(TEMP,"NOM~"_REF,.GL)
 
 S OR=$O(GL(""))
 Q:OR="" 0
 S INDL=GL(OR)
 I TYPE=2 S INDL=INDP_","_INDL
 
 S BASEL=$$REPD^%QSGEL2(REP,LIEN)
 D MSG^%VZEATT($$^%QZCHW("Repertoire")_" "_$$NOMLOG^%QSF(BASEL)_" : "_INDL)
 G:$$IR^%QSGE5(BASEL,INDL) PAS2
 
 S ER=$$LOAMV^LKZPAR(TEMP,"ORDRE",.ORD)
 S OR=$O(ORD(""))
 I OR="" S ORD=""
 I OR'="" S ORD=ORD(OR)
 S OR=$$CREPER^%QSGEIND(BASEL,INDL,ORD,.MSG)
 I OR D MSG^%VZEATT(MSG) G FCR0
PAS2 D PA^%QSGESTI(BASEL,INDL,"DATE.RECUPERATION.PASSERELLE",$$TEMPSNO^%QMDATE(DD),1)
 S @GLO@("IND",PARA,"IND")=INDL
 S @GLO@("IND",PARA,"BASE")=BASEL
LIEN 
 G:TYPE<3 PAS3
 G:$$EXILIEN^%QSGES21(INDP,LIEN,INDL) PAS3
 D ADDS^%QSGEST3(REP,INDP,LIEN,BASEL,INDL)
PAS3 
 S IDLIEN=CHEMPR_"~LIEN."_LIEN
 G:'($D(@GLO@("LIEN",IDLIEN))) PAS4
 S NOMLIEN=$$REFLIEN^%QSGES21(INDP,LIEN,INDL)
 G:NOMLIEN="" PAS4
 S @GLO@("IND",IDLIEN,"IND")=NOMLIEN
 S @GLO@("IND",IDLIEN,"BASE")=$$LIENI^%QSGEL3
 K @GLO@("LIEN",IDLIEN)
PAS4 
 S LIENI=$$INVL^LKYG2(BASEL,"INVERSE."_LIEN)
 S IDLIEN=CHEMPR_"~INVERSE."_LIENI
 G:'($D(@GLO@("LIEN",IDLIEN))) FCR1
 S NOMLIEN=$$REFLIEN^%QSGES21(INDL,LIENI,INDP)
 G:NOMLIEN="" FCR1
 S @GLO@("IND",IDLIEN,"IND")=NOMLIEN
 S @GLO@("IND",IDLIEN,"BASE")=$$LIENI^%QSGEL3
 K @GLO@("LIEN",IDLIEN)
 G FCR1
FCR0 D POCLEPA^%VVIDEO
 Q 0
FCR1 D POCLEPA^%VVIDEO
 Q 1
 
STA 
 Q:PARA="NOM"
 K VAL
 S ER=$$LOAMV^LKZPAR(TEMP,PARA,.VAL)
 D:(ER=0)&(PARA'["%") MVS^%QSCALVA(BASE,IND,PARA,"VAL")
 Q
 
STL 
 N AT,REF
 S AT=$P(PARA,"~")
 Q:AT="NOM"
 S REF=$$NOMLOG^%QSF(BASE)_"~"_$P(PARA,"~",2,99)
 K VAL
 S BASEL=@GLO@("IND",REF,"BASE")
 S INDL=@GLO@("IND",REF,"IND")
 S ER=$$LOAMV^LKZPAR(TEMP,PARA,.VAL)
 D:(ER=0)&($E(PARA)'="%") MVS^%QSCALVA(BASEL,INDL,AT,"VAL")
 Q

