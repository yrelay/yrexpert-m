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

;%TLIACTZ^INT^1^59547,74029^0
%TLIACTZ ;
 
 
CONFIG N %ETUDE,%REP,%INDIV,L,%LIEN,%POCHE,%COMPO,%LAT1,%LAT2,CREAT,BASEL
 N TYP,STATUS
 S (%IND,%REP,L)=""
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Activation de LINK"))
 S CREAT=0,POS=1
 
 S %ETUDE=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I '(POS) S CREAT=1,POS=1
 S L=$$RED(ACTI,2)
 I L=0 S L="" G CONFREP
 
 S L=$$SUBST^%ANARBR2(L,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Nom liste individus impossible a evaluer")) S ECHEC=1 Q
 I '($$EX^%QSGEST7(L)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Liste individus inexistante")) S ECHEC=1 Q
 S BASEL=$$^%QSCALVA("L0",L,"BASE")
 I BASEL="" D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Repertoire des individus liste inconnu")) Q
 S ADLIST=$$^%QSCALVA("L0",L,"ADRESSE")
 I ADLIST="" D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Adresse de stockage individus inconnue")) Q
 S %REP=$$NOMLOG^%QSF(BASEL)
 G CONFLIEN
 
CONFREP S %REP=$$RED(ACTI,3)
 I %REP=0 S %REP=CXT("@","BASE") G CONFOBJ
 S %REP=$$SUBST^%ANARBR2(%REP,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Repertoire impossible a evaluer")) S ECHEC=1 Q
 S %REP=$$NOMINT^%QSF(%REP)
 I %REP="" D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Repertoire inconnu")) S ECHEC=1 Q
 
CONFOBJ S %IND=$$SUBST^%ANARBR2($$RED(ACTI,4),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Nom individu impossible a evaluer")) S ECHEC=1 Q
 I '($$IR^%QSGE5(%REP,%IND)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Individu inconnu dans le repertoire")) S ECHEC=1 Q
 
CONFLIEN S %LIEN=$$RED(ACTI,5),%LIEN=$$RED(%LIEN,"TEXTE")
 S TYP=$$TYPE^%QSGEST9(%REP,%LIEN)
 I TYP=0 D:MODAF ADD^%TLIFEN("LOG","  "_%LIEN_" "_$$^%QZCHW("n'est pas un lien pour")_" "_$$NOMLOG^%QSF(%REP)) S ECHEC=1 Q
 I (TYP'=4)&(TYP'=4) D:MODAF ADD^%TLIFEN("LOG","  "_%LIEN_" "_$$^%QZCHW("n'est pas un lien invoultif pour")_" "_$$NOMLOG^%QSF(%REP)) S ECHEC=1 Q
 
 S %POCHE=$$SUBST^%ANARBR2($$RED(ACTI,6),.CXT,"ATT^%TLIACT3",.POS)
 I '(POS) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Nom Poche impossible a evaluer")) S ECHEC=1 Q
 I '($D(^[QUI]EXPLICIT(%POCHE))) D:MODAF ADD^%TLIFEN("LOG","  "_%POCHE_":"_$$^%QZCHW("poche inconnue")) S ECHEC=1 Q
 
 
 S %LAT1=$$SUBST^%ANARBR2($$RED(ACTI,7),.CXT,"ATT^%TLIACT3",.POS)
 I '(POS) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Nom 1ere liste d'attributs impossible a evaluer")) S ECHEC=1 Q
 G:(%LAT1="")!(%LAT1="*") CONFLAT2
 I '($$EX^%QMLILA(%LAT1)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("1ere liste d'attributs inexistante")) S ECHEC=1 Q
 
CONFLAT2 S %LAT2=$$SUBST^%ANARBR2($$RED(ACTI,8),.CXT,"ATT^%TLIACT3",.POS)
 I '(POS) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Nom 2eme liste d'attributs impossible a evaluer")) S ECHEC=1 Q
 G:(%LAT2="")!(%LAT2="*") CONFCOMP
 I '($$EX^%QMLILA(%LAT2)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("2eme liste d'attributs inexistante")) S ECHEC=1 Q
 
CONFCOMP S COMPO=$$RED(ACTI,9)
 I COMPO=0 S COMPO="AVEC.COMPOSANTS" G CONFACT^%TLIACR1
 S COMPO=$$SUBST^%ANARBR2(COMPO,.CXT,"ATT^%TLIACT3",.POS)
 I '(POS) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Avec ou sans composant impossible a evaluer")) S ECHEC=1 Q
 S COMPO=$S(COMPO=$$^%QZCHW("AVEC.COMPOSANTS"):"AVEC.COMPOSANTS",COMPO=$$^%QZCHW("SANS.COMPOSANT"):"SANS.COMPOSANT",1:"")
 I COMPO="" D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("""AVEC.COMPOSANTS"" ou ""SANS.COMPOSANT"" uniquement")) S ECHEC=1 Q
 
 G CONFACT^%TLIACR1
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)
 ;

