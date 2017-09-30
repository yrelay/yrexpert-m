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

;%MZGAM2^INT^1^59547,73871^0
MOZGAM2 ;
 
 
 
 
 
INIT(UTIL,REP,REP2,GAM,AJ) 
 N CTR,CPT,P,I
INIT0 S GLO="^[QUI]MOZPARA(""GRILLE"",UTIL,REP,1)"
 F CPT=2:1:18 D ECRL
 F I=20:1:26 D FORME(I,16)
 F I=27,30,31 D FORME(I,16)
 F I=28,29,32 D FORM2(I,29)
 F I=33 D FORM2(I,17)
 F I=34 D FORM2(I,10)
 F I=35,36 D FORM2(I,13)
 Q
 
ECRL S P=0,ATT=$P(@GLO@(CPT),"^",1),IND=$P(@GLO@(CPT),"^",2),LIB=$P(@GLO@(CPT),"^",4),RESUL(CPT+18)=LIB
 S:(ATT="")!(LIB=".") PATOUCH(CPT)=1
 S:ATT["!" P=1
 S:'(AJ) RESUL(CPT)=$$^%QSCALV2($S(P:$P(ATT,"!",2),1:""),REP2,GAM,$P(ATT,"!"),IND)
 Q
 
MAJ(UTIL,REP,REP2,GAM,AJ) 
 
CREAG 
 N RPERE,NPERE,RFILS,NFILS,LIENPF,FILS,NOMEX
 I '($$GOOD^%MZUC2(RESUL(1))) S REFGAM=1,RESUL(1)="" D POCLEPA^%VVIDEO Q
 G:RPERE="" STOG
STOL 
 G:'(AJ) STOG
 S LIENPF=$$LIENPF^%QSGEL2(RPERE,RFILS)
 S NOMEX=$$NOMEX^%QSGES10(RFILS,NFILS)
 D ADDO^%QSGEST3(RPERE,NPERE,NOMEX,LIENPF,RFILS,NOMEX)
STOG N P S GLO="^[QUI]MOZPARA(""GRILLE"",UTIL,REP,1)"
 D PA^%QSGESTI(REP2,GAM,"NOM",FILS,1)
 F CPT=2:1:18 S P=0,%U=CPT,ATT=$P(@GLO@(%U),"^",1),IND=$P(@GLO@(%U),"^",2),LIB=$P(@GLO@(%U),"^",4) S:(ATT["!")&(RPERE'="") P=1 D STOATT
 D POCLEPA^%VVIDEO
 Q
STOATT N REP,INDIV,ATTRI
 S REP=$S(P:RPERE,1:REP2),INDIV=$S(P:NPERE,1:GAM),ATTRI=$P(ATT,"!")
 D PA^%QSGESTI(REP,INDIV,ATTRI,$S($D(ASTOCK(CPT)):ASTOCK(CPT),1:RESUL(CPT)),IND)
 Q
FORME(I,LIM) 
 N LG S RESUL(I)=" "_$E(RESUL(I),1,LIM)
 I $L(RESUL(I))>LIM Q
 S LG=$L(RESUL(I))
 F %U=1:1:(LIM+1)-LG S RESUL(I)=RESUL(I)_" "
 Q
 
FORM2(I,LIM) 
 N LG,DEMI,DROITE,GAUCHE,%U
 S DEMI=LIM\2,LG=$L(RESUL(I))
 I LG>LIM S RESUL(I)=$E(RESUL(I),1,LIM) Q
 S DROITE=DEMI-(LG\2),GAUCHE=(LIM-DROITE)-LG
 F %U=1:1:DROITE S RESUL(I)=" "_RESUL(I)
 F %U=1:1:GAUCHE S RESUL(I)=RESUL(I)_" "
 Q
 
UCONT 
 N CTR,CPT,LST,ROUT,LG
 D INITUC^%MZCONF2(.LST)
 F CPT=2:1:18 S CTR=$P(@GLO@(CPT),"^",3) D CTR(CPT,CTR)
 Q
 
CTR(I,C) 
 N SSCH
 S ROUT="DATE^%MZGAM2"
 I C="" G CTR0
 I $E(C,1)?1A D CTR1 Q
 S LG=$L(I,",")
 F %U=1:1:LG S SSCH=LST($P(C,",",%U),0) Q:SSCH=""  S ROUT=ROUT_","_SSCH
CTR0 S ^%SCRE(SCR,I,4)=ROUT
 Q
CTR1 S ^%SCRE(SCR,I,4)=LST(8,0)_"("""_C_""")" Q
 
FUCONT 
 F I=2:1:18 S ^%SCRE(SCR,I,4)=""
 Q
 
DATE 
 N BA,OBJ,IND,ATT,VAL,VALAFFI,LG,CH
 S LG=$L(RESUL(IC))
 S VAL=RESUL(IC)
 D CONT(IC,.BA,.ATT)
 
 
 I '($$FINT2^%QMDAUC(BA,ATT,.VAL)) D ^%VZEAVT($$^%QZCHW("La valeur de l'attribut doit etre de type date")) S REFUSE=1 Q
 S CH=$$AFFI^%QMDAUC(BA,ATT,VAL),ASTOCK(IC)=VAL
 S TAB(IC)=$J(" ",LG) D ^%VAFFICH
 S TAB(IC)=CH D ^%VAFFICH
 Q
1 D FULL^%LXUC4 Q
2 Q:RESUL(IC)=""
 I '($$ENTP^%QZNBN(RESUL(IC))) D ^%VZEAVT("La valeur de l'attribut doit etre entiere et positive") S REFUSE=1 Q
 Q
3 Q:RESUL(IC)=""
 I '($$ENT^%QZNBN(RESUL(IC))) D ^%VZEAVT("La valeur de l'attribut doit etre entiere") S REFUSE=1 Q
 Q
4 Q:RESUL(IC)=""
 I '($$NUM^%QZNBN(RESUL(IC))) D ^%VZEAVT("La valeur de l'attribut doit etre numerique") S REFUSE=1 Q
 Q
5 Q:RESUL(IC)=""
 I '($$POS^%QZNBN(RESUL(IC))) D ^%VZEAVT("La valeur de l'attribut doit etre numerique et positive") S REFUSE=1 Q
 Q
6 Q:%AJM="A"
 Q:RESUL(IC)=AFRESU(IC)
 N LG S LG=$L(RESUL(IC))
 D ^%VZEAVT("Ce champ a ete declare non modifiable ...") S REFUSE=0,TAB(ICC)=$J(" ",LG) D ^%VAFFICH S TAB(ICC)=AFRESU(IC) D ^%VAFFICH Q
 Q
 
MACH 
 D MACH^%MZS03 Q
ITEM(TYP) 
 Q:RESUL(IC)=""
 I RESUL(IC)="?" D ITEM^%MZS03(RESUL(IC),TYP,IC) Q
 I TYP="OUTIL" D OUTIL Q
 I $D(^[QUI]MOZITEM(TYP,RESUL(IC))) Q
 S DX=1,DY=23 X XY S REP=$$MES^%VZEOUI($$^%QZCHW("Inconnu dans le domaine "_TYP_" voulez-vous l'inserer ? "),"N")
 I REP'=1 D POCLEPA^%VVIDEO S REFUSE=1 Q
 I '($$AUTOR^%MZACVOC(WHOIS)) D ^%VZEAVT("acces non autorise") S REFUSE=1 Q
 I TYP="ACTION" S OBJ=RESUL(IC) D ACT^%MZS04,POCLEPA^%VVIDEO Q
 S ^[QUI]MOZITEM(TYP,RESUL(IC))="",REFUSE=0 D POCLEPA^%VVIDEO Q
 Q
OUTIL I $D(^[QUI]DESOUT($$M^%QAX(RESUL(IC)))) S REFUSE=0 Q
 S DX=1,DY=23 X XY I '($$MES^%VZEOUI($$^%QZCHW("Inconnu dans le domaine "_TYP_" voulez-vous l'inserer ? "),"N")) S REFUSE=1 D POCLEPA^%VVIDEO Q
 I '($$AUTOR^%MZACVOC(WHOIS)) D ^%VZEAVT("acces non autorise") S REFUSE=1 Q
 N GLOOUT
 S GLOOUT=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"OUTIL")
 K @(GLOOUT)
 S @GLOOUT@(1)=$$M^%QAX(RESUL(IC))
 S REFUSE=0,NOMTAB="" D POINT^%VAPPELG("DESOUT",GLOOUT)
 K @(GLOOUT)
 D:$$^%QCAZG("XOP")=2 OPC^%MZEDOP(EDCL) S %=3,RM=80 O $I S:'($D(^[QUI]DESOUT($$M^%QAX(RESUL(IC))))) REFUSE=1
 D POCLEPA^%VVIDEO Q
 
SELECT(NG) 
 I '($D(^TABIDENT(WHOIS,"MOZART",NG,"GE"))) S NG=$$GE^%MZQS Q
 D GET^%MZREP Q
 
CONT(IC,BA,ATT) 
 
 N P
 S ATT=$P(@GLO@(IC),"^",1)
 I ATT["!" D PROX
 E  S BA=$$GI^%MZQS
 Q
PROX 
 
 
 N LIEN
 D PEREFILS^%QSGEL2($$GI^%MZQS,.BA,.LIEN)
 S ATT=$P(ATT,"!",1)
 Q

